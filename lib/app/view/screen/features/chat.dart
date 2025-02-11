import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../widget/text.form.field.dart';

class Chat extends ConsumerWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE2E8),
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              spacing: 10,
              children: [
                IntrinsicHeight(
                  child: OverflowBox(
                    minWidth: 0,
                    maxWidth: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24, left: 20, right: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'zurück',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                color: Color(0xFFA44B6F),
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Anna'
                                ),
                                Text(
                                  'Geöffnet',
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFF6C1233),
                                borderRadius: BorderRadius.all(Radius.circular(12))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SvgPicture.asset(AppImages.user, color: Colors.white,),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 20,),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    width: MediaQuery.of(context).size.width *0.6,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA44B6F),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                                  
                                  Positioned(
                                    bottom: 0,
                                    right: 20,
                                    child: CustomPaint(
                                      painter: BubbleTailPainter(color: Color(0xFFA44B6F), isLeft: false),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30,),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Container(
                                width: MediaQuery.of(context).size.width *0.6,
                                height: 104,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(16),
                                          bottomLeft:  Radius.circular(16)
                                        )
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(14),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '30 €',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            'Marcalberto',
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),
                                          Text(
                                            'Model 3',
                                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    width: MediaQuery.of(context).size.width *0.6,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFA44B6F), // Adjust to match your color
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomLeft: Radius.circular(16),
                                        topRight: Radius.circular(16)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                                  
                                  Positioned(
                                    bottom: 0,
                                    right: 20,
                                    child: CustomPaint(
                                      painter: BubbleTailPainter(color: Color(0xFFA44B6F), isLeft: false),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(16),
                                    width: MediaQuery.of(context).size.width *0.6,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD92C4A), // Adjust to match your color
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                        topRight: Radius.circular(16)
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 8,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                        color: Colors.white
                                      ),
                                    ),
                                  ),
                                                  
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: CustomPaint(
                                      painter: BubbleTailPainter(color: Color(0xFFD92C4A), isLeft: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 10,
                        right: 10,
                        child: AppTextFormField(
                          controller: TextEditingController(),
                          hintText: 'Nachricht senden...',
                          maxLines: 4,
                          suffixIcon: GestureDetector(
                            onTap: (){},
                            child: Container(
                              margin: EdgeInsets.all(10),
                              height: 34,
                              width: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                color: Color(0xFFA44B6F),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SvgPicture.asset(AppImages.arrowup),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BubbleTailPainter extends CustomPainter {
  final Color color;
  final bool isLeft;

  BubbleTailPainter({required this.color, required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(20, 20);
    path.lineTo(20, 0);
    path.close();

    var path1 = Path();
    path1.moveTo(0, 0);
    path1.lineTo(0, 20);
    path1.lineTo(30, 0);
    path1.close();

    canvas.drawPath(isLeft == true ? path1 : path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}