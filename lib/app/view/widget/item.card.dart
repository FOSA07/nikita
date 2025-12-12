import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constant/image.dart';

class ItemCard extends StatelessWidget {
  final String image;
  final String name;
  final String model;
  final String price;
  final double rating;
  const ItemCard({
    super.key, 
    required this.image, 
    required this.name, 
    required this.model, 
    required this.price,
    required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF1E2024).withValues(alpha: 0.10),
            offset: Offset(6, 12),
            blurRadius: 24,  
            spreadRadius: 0, 
          ),
        ]
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: Color(0xFFA44B6F),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), 
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  spacing: 5,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      model,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.grey
                      ),
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Text(
                          price,
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'fur 2 std',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            color: Color(0xFFA44B6F),
                          ),
                          child: Row(
                            spacing: 5,
                            children: [
                              SvgPicture.asset(AppImages.rating),
                              Text(
                                rating.toString(),
                                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}