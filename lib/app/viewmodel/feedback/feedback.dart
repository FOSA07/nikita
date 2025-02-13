import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/dio/dio.client.dart';

part 'feedback.g.dart';

@Riverpod(keepAlive: true)
class GetFeedbacksNotifier extends _$GetFeedbacksNotifier {

  Future getFeedbacks () async{
    var response =
        await DioClient().get('/feedbacks');
    log(response.toString());

    return response.fold((failure) {
      return failure;
    }, (result) {
      log(result.toString());
      try {
        print(result.data["data"]["feedbacks"].length);
        return result.data["data"]["feedbacks"];
      } catch (e) {
        log("An Error Occured");
        return "An error occured";
      }
    });
  }

  Future build () {
    return getFeedbacks();
  }

}