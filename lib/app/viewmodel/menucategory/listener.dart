import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'listener.g.dart';

@Riverpod(keepAlive: true)
class ListenerNotifier extends _$ListenerNotifier {

  ValueNotifier valueNotifier = ValueNotifier(false);

  Future build () {
    return Future((){});
    // return valueNotifier;
  }

  toggleValueNotifier () {
    valueNotifier.value = !valueNotifier.value;
  }
}