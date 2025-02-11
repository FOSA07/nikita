import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/constant/image.dart';
import '../../helper/router.dart';
import '../../widget/background.dart';
import '../../widget/review.card.dart';

class Reviews extends StatelessWidget with ViewRouter {
  const Reviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                          Text(
                            '30',
                            style: Theme.of(context).textTheme.titleMedium,
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
                      Container(
                        padding: EdgeInsets.all(15),
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFC53D),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child: Row(
                          spacing: 5,
                          children: [
                          SvgPicture.asset(AppImages.rating),
                          Text(
                            '5.0',
                            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: Colors.white
                            ),
                          )
                        ],),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          spacing: 13,
                          children: List.generate(
                            20, 
                            (index) => ReviewCard(
                              comment: 'Take as many pixel-perfect UI elements as you want and style them the way you need in a fraction of the time.',
                              name: "Jackie Forman"
                            )
                          ),
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        )
      ),
    );
  }
}