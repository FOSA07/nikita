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

    if (response.requestOptions.path == '/auth/login' && response.statusCode == 200 && response.data["status_code"] == 200) {
      final token = UserLoggedInModel.fromMap(response.data["data"]);
      final tokenResult = await _userStorageController.storeToken(token.token);
      final idResult = await _userStorageController.storeId(token.user.id);

      idResult.fold(
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

      // tokenResult.fold(
      //   (failure) {
      //     handler.reject(DioException(
      //       requestOptions: response.requestOptions,
      //       response: response,
      //       error: Exception('Failed to store token'),
      //     ));
      //     return;
      //   },
      //   (_) {
      //   },
      // );
        }

    handler.next(response);
  }


  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  bool _requiresToken(String path) {
    print(path);
    
    const tokenRequiredPaths = [
      '/menu',
      '/restaurant',
      '/feedbacks',
      '/feedback',
      '/questions',
      '/tables'
    ];

    return tokenRequiredPaths.any((requiredPath) => path.startsWith(requiredPath));
  }
}
