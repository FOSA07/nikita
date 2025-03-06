import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/feedback/feedback.dart';
import '../../helper/router.dart';
import '../../widget/background.dart';
import '../../widget/review.card.dart';

class Reviews extends ConsumerStatefulWidget {
  const Reviews({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewsState();
}

class _ReviewsState extends ConsumerState<Reviews> with ViewRouter {

  @override
  Widget build(BuildContext context) {

    final getFeedbacks = ref.watch(getFeedbacksNotifierProvider);
    ValueNotifier totalVotings = ValueNotifier(0);

    return Scaffold(
      body: SafeArea(
        child: Background(

          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
              child: Column(
                
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {back();}, 
                        child: Text(
                          'back',
                          textAlign: TextAlign.left,
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Color(0xFFA44B6F),
                            fontWeight: FontWeight.bold
                          ),
                        )
                      ),
                    ],
                  ),
                  IntrinsicHeight(
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ValueListenableBuilder(
                              valueListenable: totalVotings,
                              builder: (context, value, child) {
                                return Text(
                                  totalVotings.value.toString(),
                                  style: Theme.of(context).textTheme.titleMedium,
                                );
                              }
                            ),
                            Text(
                              'votings',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        // Container(
                        //   padding: EdgeInsets.all(15),
                        //   height: double.infinity,
                        //   decoration: BoxDecoration(
                        //     color: Color(0xFFFFC53D),
                        //     borderRadius: BorderRadius.all(Radius.circular(12))
                        //   ),
                        //   child: Row(
                        //     spacing: 5,
                        //     children: [
                        //     SvgPicture.asset(AppImages.rating),
                        //     Text(
                        //       '5.0',
                        //       style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        //         color: Colors.white
                        //       ),
                        //     )
                        //   ],),
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  
                  Expanded(
                    child: getFeedbacks.when(
                      data: (data) {
                        
                        if (data is List) {
                          totalVotings.value = data.length;
                        return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) => Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              spacing: 13,
                              children: List.generate(
                                data.length, 
                                (index) {
                                  return ReviewCard(
                                  comment: data[index]["content"],
                                  name: data[index]["user_name"]
                                );
                                }
                              ),
                            )
                          ],
                        ));
                        } else {
                          return Center(child: getFeedbacks.isLoading ?
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ) : TextButton(
                            onPressed: () => ref.invalidate(getFeedbacksNotifierProvider),
                            // style: const ButtonStyle(backgroundColor: 
                            //   WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
                            child: const Text("reload"),  
                          ));
                        }
                      },
                      error: (error, stackTrace) => Center(child: getFeedbacks.isLoading ?
                          const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ) : TextButton(
                            onPressed: () => ref.invalidate(getFeedbacksNotifierProvider),
                            style: const ButtonStyle(backgroundColor: 
                              WidgetStatePropertyAll(Color.fromARGB(255, 208, 230, 249))),
                            child: const Text("reload"),  
                          )),
                      loading: () => const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        )
                      )
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}