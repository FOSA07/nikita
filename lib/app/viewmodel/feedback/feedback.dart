import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/dio/dio.client.dart';

part 'feedback.g.dart';

@Riverpod(keepAlive: true)
class GetFeedbacksNotifier extends _$GetFeedbacksNotifier {

  Future getFeedbacks () async{
    var response =
        await DioClient().get('/feedback');
    log(response.toString());
    print(response);

    return response.fold((failure) {
      return failure;
    }, (result) {
      log(result.toString());
      try {
        print(result.data["data"].length);
        return result.data["data"];
      } catch (e) {
        log("An Error Occured");
        return "An error occured";
      }
    });
  }

  @override
  Future build () {
    return getFeedbacks();
  }

}