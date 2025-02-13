import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  final String comment;
  final String name;
  const ReviewCard({super.key, required this.comment, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: [
          Text(
            comment,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.grey.shade500,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Color(0xFFA44B6F),
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}