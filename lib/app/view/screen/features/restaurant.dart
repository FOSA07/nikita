import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../helper/router.dart';
import '../../widget/action.button.dart';

class Restaurant extends StatelessWidget with ViewRouter {
  const Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
        
              )
            ),
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFFF2EBF0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15,),
                  Text(
                    'Restaurant',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 15,),
                  IntrinsicHeight(
                    child: OverflowBox(
                      minWidth: 0,
                      maxWidth: MediaQuery.of(context).size.width,
                      child: const Divider(
                        endIndent: 0,
                        indent: 55,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppActionButton(
                        text: 'Bewertungen', 
                        fullWidth: false,
                        height: 43,
                        onPressed: (){
                          goto('/nikita/reviews/');
                        }, 
                        isLoading: false,
                      ),
                      Column(
                        spacing: 3,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(5, 
                              (index) => SvgPicture.asset(AppImages.ratingfilled)
                            ),
                          ),
                          Text(
                            '25 Bewertungen',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.grey
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 25,),
                  AppActionButton(
                    text: 'Speisekarte', 
                    onPressed: (){}, 
                    isLoading: false
                  ),
                  const SizedBox(height: 25,),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}