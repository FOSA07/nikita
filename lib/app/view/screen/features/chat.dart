import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/chat/chat.dart';
import '../../../viewmodel/chat/messages.dart';
import '../../helper/router.dart';
import '../../widget/text.form.field.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> with ViewRouter {

  final TextEditingController _textController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // You can optionally set an initial value here
    _textController.text = '';
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messageNotifierProvider);

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
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: messages.length,
                          itemBuilder: (context, index) {
                            final message = messages[index];
                            print(message);
                            return Column(
                              children: [
                                if (index == 0) const SizedBox(height: 15),
                                messageBox(message["sender"].toString().toLowerCase(), message["message"], false),
                                const SizedBox(height: 30)
                              ],
                            );
                            // return ListTile(
                            //   title: Text(message["sender"]),
                            //   subtitle: Text(message["message"]),
                            // );
                          },
                        ),
                        // child: SingleChildScrollView(
                        //   child: Column(
                        //     children: [
                        //       const SizedBox(height: 20,),
                        //       Align(
                        //         alignment: AlignmentDirectional.centerEnd,
                        //         child: Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               padding: const EdgeInsets.all(16),
                        //               width: MediaQuery.of(context).size.width *0.6,
                        //               decoration: BoxDecoration(
                        //                 color: Color(0xFFA44B6F),
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(16),
                        //                   bottomLeft: Radius.circular(16),
                        //                   topRight: Radius.circular(16)
                        //                 ),
                        //                 boxShadow: [
                        //                   BoxShadow(
                        //                     color: Colors.black26,
                        //                     blurRadius: 8,
                        //                     offset: Offset(0, 4),
                        //                   ),
                        //                 ],
                        //               ),
                        //               child: Text(
                        //                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        //                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //                   color: Colors.white
                        //                 ),
                        //               ),
                        //             ),
                                                    
                        //             Positioned(
                        //               bottom: 0,
                        //               right: 20,
                        //               child: CustomPaint(
                        //                 painter: BubbleTailPainter(color: Color(0xFFA44B6F), isLeft: false),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(height: 30,),
                        //       GestureDetector(
                        //         onTap: () {
                        //           print("pressed");
                        //           goto('/nikita/iteminfo');
                        //         },
                        //         child: Align(
                        //           alignment: AlignmentDirectional.centerStart,
                        //           child: Container(
                        //             width: MediaQuery.of(context).size.width * 0.6,
                        //             height: 104,
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.all(Radius.circular(16)),
                        //               boxShadow: [
                        //                 BoxShadow(
                        //                   color: Colors.black26,
                        //                   blurRadius: 8,
                        //                   offset: Offset(0, 4),
                        //                 ),
                        //               ],
                        //             ),
                        //             child: Row(
                        //               children: [
                        //                 Container(
                        //                   height: double.infinity,
                        //                   width: MediaQuery.of(context).size.width * 0.2,
                        //                   decoration: BoxDecoration(
                        //                     color: Colors.red,
                        //                     borderRadius: BorderRadius.only(
                        //                       topLeft: Radius.circular(16),
                        //                       bottomLeft:  Radius.circular(16)
                        //                     )
                        //                   ),
                        //                 ),
                        //                 Padding(
                        //                   padding: EdgeInsets.all(14),
                        //                   child: Column(
                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                        //                     children: [
                        //                       Text(
                        //                         '30 €',
                        //                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //                           fontWeight: FontWeight.bold
                        //                         ),
                        //                       ),
                        //                       Text(
                        //                         'Marcalberto',
                        //                         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        //                           fontWeight: FontWeight.bold
                        //                         ),
                        //                       ),
                        //                       Text(
                        //                         'Model 3',
                        //                         style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //                           fontWeight: FontWeight.bold,
                        //                           color: Colors.grey
                        //                         ),
                        //                       )
                        //                     ],
                        //                   ),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       const SizedBox(height: 20,),
                        //       Align(
                        //         alignment: AlignmentDirectional.centerEnd,
                        //         child: Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               padding: const EdgeInsets.all(16),
                        //               width: MediaQuery.of(context).size.width *0.6,
                        //               decoration: BoxDecoration(
                        //                 color: Color(0xFFA44B6F), // Adjust to match your color
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(16),
                        //                   bottomLeft: Radius.circular(16),
                        //                   topRight: Radius.circular(16)
                        //                 ),
                        //                 boxShadow: [
                        //                   BoxShadow(
                        //                     color: Colors.black26,
                        //                     blurRadius: 8,
                        //                     offset: Offset(0, 4),
                        //                   ),
                        //                 ],
                        //               ),
                        //               child: Text(
                        //                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        //                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //                   color: Colors.white
                        //                 ),
                        //               ),
                        //             ),
                                                    
                        //             Positioned(
                        //               bottom: 0,
                        //               right: 20,
                        //               child: CustomPaint(
                        //                 painter: BubbleTailPainter(color: Color(0xFFA44B6F), isLeft: false),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(height: 20,),
                        //       Align(
                        //         alignment: AlignmentDirectional.centerStart,
                        //         child: Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               padding: const EdgeInsets.all(16),
                        //               width: MediaQuery.of(context).size.width *0.6,
                        //               decoration: BoxDecoration(
                        //                 color: Color(0xFFD92C4A), // Adjust to match your color
                        //                 borderRadius: BorderRadius.only(
                        //                   topLeft: Radius.circular(16),
                        //                   bottomRight: Radius.circular(16),
                        //                   topRight: Radius.circular(16)
                        //                 ),
                        //                 boxShadow: [
                        //                   BoxShadow(
                        //                     color: Colors.black26,
                        //                     blurRadius: 8,
                        //                     offset: Offset(0, 4),
                        //                   ),
                        //                 ],
                        //               ),
                        //               child: Text(
                        //                 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ',
                        //                 style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        //                   color: Colors.white
                        //                 ),
                        //               ),
                        //             ),
                                                    
                        //             Positioned(
                        //               bottom: 0,
                        //               left: 0,
                        //               child: CustomPaint(
                        //                 painter: BubbleTailPainter(color: Color(0xFFD92C4A), isLeft: true),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                      AppTextFormField(
                        controller: _textController,
                        hintText: 'Ask Something...',
                        focusNode: _focusNode,
                        maxLines: 4,
                        suffixIcon: GestureDetector(
                          onTap: (){
                            if(_textController.text.isNotEmpty){
                              FocusScope.of(context).unfocus();
                              ref.read(messageNotifierProvider.notifier).adder({
                                "sender": "USER",
                                "message": _textController.text
                              });

                              ref.read(chatNotifierProvider.notifier).chatMessage(_textController.text);
                              _textController.text = '';
                            }
                            
                          },
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
                      const SizedBox(
                        height: 25,
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

  Widget messageBox (String from, String message ,bool product) {

    if(from == "user") {
      return Align(
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
                message,
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
      );
    } else if (from == "chatgpt") {
      return Align(
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
                message,
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
      );
    }

    return SizedBox();
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