import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/restaurant/restaurant.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';

class Restaurant extends ConsumerStatefulWidget {
  final int tableId;
  const Restaurant({super.key, required this.tableId});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RestaurantState();
}

class _RestaurantState extends ConsumerState<Restaurant> with ViewRouter {
  
  Widget _loadingIndicator() {
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(strokeWidth: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final getRestaurant = ref.watch(getRestaurantNotifierProvider(widget.tableId));
    // final getRestaurant = ref.watch(getRestaurantNotifierProvider(10));
    final starIcon = SvgPicture.asset(AppImages.ratingfilled);

    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child: getRestaurant.when(
            data: (data) => data is Map ? Column(
              children: [
                Expanded(child: Container(
                
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1504674900247-0877df9cc836', // Direct Unsplash image URL
                      ),
                      fit: BoxFit.cover, // Adjust as needed
                      opacity: 0.8, // Adjust transparency (0.0 - fully transparent, 1.0 - fully visible)
                    ),
                  ),
                )), // Placeholder for future content
                Container(
                  padding: const EdgeInsets.all(15),
                  width: size.width,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2EBF0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text(
                        data["name"].toString(),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 15),
                      const Divider(indent: 55, endIndent: 0),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppActionButton(
                            text: 'Bewertungen', 
                            fullWidth: false,
                            height: 43,
                            onPressed: () => goto('/nikita/reviews/'), 
                            isLoading: false,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(5, (index) => starIcon),
                              ),
                              Text(
                                '25 Bewertungen',
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      AppActionButton(
                        text: 'Anna wine AI', 
                        onPressed: () async {
                          goto('/nikita/chat');
                        }, 
                        isLoading: false,
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ) : Center(
              child: getRestaurant.isLoading
                ? _loadingIndicator()
                : TextButton(
                    onPressed: () => ref.invalidate(getRestaurantNotifierProvider(widget.tableId)),
                    child: const Text("reload"),
                  ),
            ),
            error: (error, stackTrace) => Center(
              child: getRestaurant.isLoading
                ? _loadingIndicator()
                : TextButton(
                    onPressed: () => ref.invalidate(getRestaurantNotifierProvider(widget.tableId)),
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Color.fromARGB(255, 208, 230, 249),
                      ),
                    ),
                    child: const Text("reload"),
                  ),
            ),
            loading: () => _loadingIndicator(),
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../utils/constant/image.dart';
// import '../../../viewmodel/restaurant/restaurant.dart';
// import '../../helper/router.dart';
// import '../../widget/action.button.dart';

// class Restaurant extends ConsumerStatefulWidget {
//   final int tableId;
//   const Restaurant({super.key, required this.tableId});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _RestaurantState();
// }

// class _RestaurantState extends ConsumerState<Restaurant> with ViewRouter {

//   @override
//   Widget build(BuildContext context) {

//     final getRestaurant = ref.watch(getRestaurantNotifierProvider(10));

//     return Scaffold(
//       body: SafeArea(

//         child: Container(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: getRestaurant.when(
//             data: (data) => data is Map ? Column(
//               children: [
//                 Expanded(
//                   child: Container(
                    
//                   )
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(15),
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Color(0xFFF2EBF0)
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(height: 15,),
//                       Text(
//                         data["name"].toString(),
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                       const SizedBox(height: 15,),
//                       IntrinsicHeight(
//                         child: OverflowBox(
//                           minWidth: 0,
//                           maxWidth: MediaQuery.of(context).size.width,
//                           child: const Divider(
//                             endIndent: 0,
//                             indent: 55,
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 25,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           AppActionButton(
//                             text: 'Bewertungen', 
//                             fullWidth: false,
//                             height: 43,
//                             onPressed: (){
//                               goto('/nikita/reviews/');
//                             }, 
//                             isLoading: false,
//                           ),
//                           Column(
//                             spacing: 3,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 children: List.generate(5, 
//                                   (index) => SvgPicture.asset(AppImages.ratingfilled)
//                                 ),
//                               ),
//                               Text(
//                                 '25 Bewertungen',
//                                 style: Theme.of(context).textTheme.labelLarge!.copyWith(
//                                   color: Colors.grey
//                                 ),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 25,),
//                       AppActionButton(
//                         text: 'Anna wine AI', 
//                         onPressed: (){
//                           goto('/nikita/chat');
//                         }, 
//                         isLoading: false
//                       ),
//                       const SizedBox(height: 25,),
//                     ],
//                   ),
//                 )
//               ],
//             ) : Center(child: getRestaurant.isLoading ?
//                 const SizedBox(
//                   height: 20,
//                   width: 20,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                   ),
//                 ) : TextButton(
//                   onPressed: () => ref.invalidate(getRestaurantNotifierProvider(5)),
//                   // style: const ButtonStyle(backgroundColor: 
//                   //   WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
//                   child: const Text("reload"),  
//                 )),
//             error: (error, stackTrace) => Center(child: getRestaurant.isLoading ?
//                 const SizedBox(
//                   height: 20,
//                   width: 20,
//                   child: CircularProgressIndicator(
//                     strokeWidth: 2,
//                   ),
//                 ) : TextButton(
//                   onPressed: () => ref.invalidate(getRestaurantNotifierProvider(5)),
//                   style: const ButtonStyle(backgroundColor: 
//                     WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
//                   child: const Text("reload"),  
//                 )),
//             loading: () => const Center(
//               child: SizedBox(
//                 height: 20,
//                 width: 20,
//                 child: CircularProgressIndicator(
//                   strokeWidth: 2,
//                 ),
//               )
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }