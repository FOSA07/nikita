import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../network/dio/dio.client.dart';

part 'restaurant.g.dart';

@Riverpod(keepAlive: true)
class GetRestaurantNotifier extends _$GetRestaurantNotifier {

  Future getRestaurant (int table) async{
    var response =
        // await DioClient().get('/restaurant/tables/$table');
        await DioClient().get('/tables/$table');
    log(response.toString());
    print(response);

    return response.fold((failure) {
      return failure;
    }, (result) {
      log(result.toString());
      try {
        return result.data["data"];
      } catch (e) {
        log("An Error Occured");
        return "An error occured";
      }
    });
  }

  @override
  Future build (int table) {
    return getRestaurant(table);
  }

}