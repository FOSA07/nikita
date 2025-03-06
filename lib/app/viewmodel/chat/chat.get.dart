import 'package:dartz/dartz.dart';
import 'package:nikita/app/core/exception/exception.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/controller/storage/user.dart';
import '../../network/dio/dio.client.dart';
import '../restaurant/restaurant.id.dart';
import 'messages.dart';

part 'chat.get.g.dart';
@Riverpod(keepAlive: true)
class GetChatNotifier extends _$GetChatNotifier {

  Future getChat () async {

    int restaurantId = ref.read(restaurantIdNotifierProvider);
    final messageNotifier = ref.read(messageNotifierProvider.notifier);
    Either<Failure, String?> userId = await UserStorageController().getId();

    print(userId);

    if(userId.isRight()){
      if (userId.isRight()) {
        final actualId = userId.getOrElse(() => null);
        print("User ID: $actualId");

        var response =
        await DioClient().get('/ai/chat', data: {
          "user_id": int.parse(actualId!),
          // "restaurant_id": restaurantId
          "restaurant_id": 4
        });
        print(response);

        return response.fold((failure) {
          return failure;
        }, (result) {
          try {

            for (final msg in result.data["data"]["chatHistory"]) {
              print(msg);
              messageNotifier.adder({
                "sender": "USER",
                "message": msg["message"],
              });

              messageNotifier.adder({
                "sender": "CHATGPT",
                "message": msg["response"],
                "recommendation": msg["recommendation"],
                "recommended_dishes": msg["recommended_dishes"]
              });
            }
            return result.data["data"]["chatHistory"];
          } catch (e) {
            return "An error occured";
          }
        });
      }

    }

    var response =
        await DioClient().get('/ai/chat');
    print(response);

    return response.fold((failure) {
      return failure;
    }, (result) {
      try {
        return result.data["data"]["chatHistory"];
      } catch (e) {
        return "An error occured";
      }
    });
  }

  @override
  Future build () {
    return getChat();
  }
}
