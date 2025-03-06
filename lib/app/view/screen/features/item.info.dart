import 'package:flutter/material.dart';

import '../../helper/router.dart';

class ItemInfo extends StatelessWidget with ViewRouter {
  final String name;
  final String image;
  final String price;
  final String description;
  const ItemInfo({
    super.key, 
    required this.name, 
    required this.image, 
    required this.price, 
    required this.description
  });

  @override
  Widget build(BuildContext context) {

    ValueNotifier<bool> fav = ValueNotifier(false);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Container(
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            image == "null" ? 'https://images.unsplash.com/photo-1504674900247-0877df9cc836' : image,
                          ),
                          fit: BoxFit.cover, // Adjust as needed
                          opacity: 0.8, // Adjust transparency (0.0 - fully transparent, 1.0 - fully visible)
                        ),
                      ), 
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(16),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //       children: [
                    //         ValueListenableBuilder(
                    //           valueListenable: fav,
                    //           builder: (context, value, child) {
                    //             return GestureDetector(
                    //               onTap: () {
                    //                 fav.value = !fav.value;
                    //               },
                    //               child: Container(
                    //                 width: 40,
                    //                 height: 40,
                    //                 padding: EdgeInsets.all(8),
                    //                 decoration: BoxDecoration(
                    //                   color: fav.value == true ? Color(0xFFD02C46) : Colors.transparent,
                    //                   borderRadius: BorderRadius.all(Radius.circular(12)),
                    //                   border: Border.all(
                    //                     color: fav.value == true ? Colors.transparent : Color(0xFFD02C46)
                    //                   )
                    //                 ),
                    //                 child: SvgPicture.asset(fav.value == true ? AppImages.fav : AppImages.favred),
                    //               ),
                    //             );
                    //           }
                    //         ),
                    //         GestureDetector(
                    //           onTap: () => back(),
                    //           child: Container(
                    //             width: 40,
                    //             height: 40,
                    //             padding: EdgeInsets.all(8),
                    //             decoration: BoxDecoration(
                    //               color: Colors.black,
                    //               borderRadius: BorderRadius.all(Radius.circular(12))
                    //             ),
                    //             child: SvgPicture.asset(AppImages.cancel),
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    
                  ],
                ),
              )
            ),
            IntrinsicHeight(
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.5
                ),
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    topLeft: Radius.circular(12)
                  ),
                  color: Color(0xFFF2EBF0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          '$price €',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    Divider(),
                    // Text(
                    //   'Marcalbeto',
                    //   style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //     color: Colors.grey
                    //   ),
                    // ),
                    const SizedBox(height: 15,),
                    // Container(
                    //   padding: EdgeInsets.only(top: 20, bottom: 20, left: 21, right: 7),
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.all(Radius.circular(12)),
                    //     color: Color(0xFFFFFBE6)
                    //   ),
                    //   child: Row(
                    //     spacing: 7,
                    //     children: [
                    //       SvgPicture.asset(AppImages.info),
                    //       Expanded(
                    //         child: Text(
                    //           'Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe, Inhaltsstoffe',
                    //           textAlign: TextAlign.center,
                    //           style: Theme.of(context).textTheme.labelLarge,
                    //         )
                    //       )
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 15,),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          child: Text(
                            description
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     AppActionButton(
                    //       text: 'Bewertungen', 
                    //       fullWidth: false,
                    //       height: 43,
                    //       onPressed: (){goto('/nikita/restaurant');}, 
                    //       isLoading: false,
                    //     ),
                    //     Column(
                    //       spacing: 3,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Row(
                    //           children: List.generate(5, 
                    //             (index) => SvgPicture.asset(AppImages.ratingfilled)
                    //           ),
                    //         ),
                    //         Text(
                    //           '25 Bewertungen',
                    //           style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    //             color: Colors.grey
                    //           ),
                    //         )
                    //       ],
                    //     )
                    //   ],
                    // ),
                    const SizedBox(height: 15,),
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}