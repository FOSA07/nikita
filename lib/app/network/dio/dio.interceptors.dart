import 'package:dio/dio.dart';

import '../../data/controller/storage/user.dart';
import '../../model/user/profile.dart';

class DioInterceptors extends Interceptor {

  final UserStorageController _userStorageController;

  DioInterceptors(this._userStorageController);

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_requiresToken(options.path)) {
      final tokenResult = await _userStorageController.getToken();

      tokenResult.fold(
        (failure) => handler.reject(
          DioException(requestOptions: options, error: 'Failed to retrieve token: ${failure.message}'),
        ),
        (token) {
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          handler.next(options);
        },
      );
    } else {

      handler.next(options);
    }
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {

    if (response.requestOptions.path == '/login' && response.statusCode == 200 && response.data["status"] == "00") {
      final token = UserProfileModel.fromJson(response.data["data"]);
      if (token.token != null) {
        final tokenResult = await _userStorageController.storeToken(token.token.split('|').last);

        tokenResult.fold(
          (failure) {
            handler.reject(DioException(
              requestOptions: response.requestOptions,
              response: response,
              error: Exception('Failed to store token'),
            ));
            return;
          },
          (_) {
          },
        );
      }
    }

    handler.next(response);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  bool _requiresToken(String path) {
    
    const tokenRequiredPaths = [
      '/menu'
    ];

    return tokenRequiredPaths.any((requiredPath) => path.startsWith(requiredPath));
  }
}
