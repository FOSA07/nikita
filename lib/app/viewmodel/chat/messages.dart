import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'messages.g.dart';

@Riverpod(keepAlive: true)
class MessageNotifier extends _$MessageNotifier {
  @override
  List<Map<String, dynamic>> build() {
    return [
      {
        "sender": "CHATGPT",
        "message": "Hi, I'm Anna. What would you like me to do for you today?",
        "recommendation": false,
        "recommended_dishes": []
      }
    ];
  }

  // Use this method to add a new message.
  void adder(Map<String, dynamic> map) {
    // state = [...state, map];
    state = [map, ...state];
  }

  void clearChat() {
    state = [];
  }

  void removeLast() {
    if (state.isNotEmpty) {
      final newState = [...state];
      // newState.removeLast();
      newState.removeAt(0);
      state = newState;
    }
  }

}
