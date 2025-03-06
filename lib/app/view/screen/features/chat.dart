import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/constant/image.dart';
import '../../../viewmodel/chat/chat.dart';
import '../../../viewmodel/chat/chat.get.dart';
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
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _textController.text = '';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _textController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    // Check if the controller has any attached scroll views.
    if (_scrollController.hasClients) {
      final maxScrollExtent = _scrollController.position.maxScrollExtent;
      _scrollController.animateTo(
        maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(messageNotifierProvider.select((state) => state));
    final getAllChat = ref.watch(getChatNotifierProvider);
    ValueNotifier update = ValueNotifier(ref.watch(messageNotifierProvider));
    int val = 0;

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
                        child: getAllChat.when(
                          data: (data) {
                            if (data is List) {
                              return ListView.builder(
                                controller: _scrollController,
                                reverse: true,
                                shrinkWrap: true,
                                itemCount: messages.length,
                                itemBuilder: (context, index) {
                                  final message = messages[index];
                                  
                                  print(message);
                                  return Column(
                                    children: [
                                      if (index == 0) const SizedBox(height: 15),
                                      MessageBox(from: message["sender"].toString().toLowerCase(), message: message["message"]),
                                      if(message["recommendation"] == true) Align(
                                        alignment: AlignmentDirectional.centerStart,
                                        child: GestureDetector(
                                          onTap: () {
                                            // print(message["recommended_dishes"][0]);
                                            print(message["recommended_dishes"][0]);
                                            goto(
                                              '/nikita/iteminfo/${message["recommended_dishes"][0]["name"].toString()}/${message["recommended_dishes"][0]["image"].toString()}/${message["recommended_dishes"][0]["price"].toString()}/${message["recommended_dishes"][0]["description"].toString()}'
                                            );
                                          },
                                          child: Container(
                                            height: 104,
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            margin: EdgeInsets.only(top: 30),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(16))
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.2,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: NetworkImage(
                                                        message["recommended_dishes"][0]["image"].toString() == "null" ? 'https://images.unsplash.com/photo-1504674900247-0877df9cc836' : message["recommended_dishes"][0]["image"].toString(),
                                                      ),
                                                      fit: BoxFit.cover, // Adjust as needed
                                                      opacity: 0.8, // Adjust transparency (0.0 - fully transparent, 1.0 - fully visible)
                                                    ),
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(16),
                                                      bottomLeft: Radius.circular(16)
                                                    )
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    padding: const EdgeInsets.all(16),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${message["recommended_dishes"][0]["price"].toString()} €',
                                                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                            color: Color(0xFF0E0F11),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w900
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: SingleChildScrollView(
                                                            child: Text(
                                                              message["recommended_dishes"][0]["name"].toString(),
                                                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                                                color: Color(0xFF000000),
                                                                // fontSize: 16
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 30),
                                      // ValueListenableBuilder(
                                      //   valueListenable: update, 
                                      //   builder: (context, value, child) {
                                      //     val = 0;
                                      //     return SizedBox();
                                      //   },
                                      // )
                                    ],
                                  );
                                },
                              );
                            }else {
                              return Center(child: getAllChat.isLoading ?
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              ) : TextButton(
                                onPressed: () => ref.invalidate(getChatNotifierProvider),
                                child: const Text("reload"),  
                              ));

                            }
                          }, 
                          error: (error, stackTrace) => Center(child: getAllChat.isLoading ?
                            const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            ) : TextButton(
                              onPressed: () => ref.invalidate(getChatNotifierProvider),
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
                        // child: ListView.builder(
                        //   itemCount: messages.length,
                        //   itemBuilder: (context, index) {
                        //     final message = messages[index];
                        //     print(message);
                        //     return Column(
                        //       children: [
                        //         if (index == 0) const SizedBox(height: 15),
                        //         messageBox(message["sender"].toString().toLowerCase(), message["message"], false),
                        //         const SizedBox(height: 30)
                        //       ],
                        //     );
                        //   },
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

}

class MessageBox extends StatelessWidget {
  final String from;
  final String message;
  const MessageBox({super.key, required this.from, required this.message});

  @override
  Widget build(BuildContext context) {
    return from == "user" ?
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
      ) : from == "chatgpt" ? Align(
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
      ) : const SizedBox();
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

