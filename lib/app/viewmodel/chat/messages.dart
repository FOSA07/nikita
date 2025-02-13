import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages.g.dart';

@Riverpod(keepAlive: true)
class MessageNotifier extends _$MessageNotifier {
  @override
  List<Map<String, dynamic>> build() {
    // This is your initial state.
    return [
      {
        "sender": "CHATGPT",
        "message": "Hi, I'm Anna. What would you like me to do for you today?"
      }
    ];
  }

  // Use this method to add a new message.
  void adder(Map<String, dynamic> map) {
    // By reassigning the state, Riverpod notifies all listeners.
    state = [...state, map];
  }

  // Clear the chat.
  void clearChat() {
    state = [];
  }
}
