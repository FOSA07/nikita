import 'package:dio/dio.dart';

import '../exception.dart';

class NetworkExceptions {
  
  static Failure handleDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return Failure("Request to API server was cancelled", exception: error);
      case DioExceptionType.connectionTimeout:
        return Failure("Connection timeout with API server", exception: error);
      case DioExceptionType.receiveTimeout:
        return Failure("Receive timeout in connection with API server", exception: error);
      case DioExceptionType.sendTimeout:
        return Failure("Send timeout in connection with API server", exception: error);
      case DioExceptionType.connectionError:
        return Failure("No internet connection", exception: error);
      case DioExceptionType.badResponse:
        return _handleResponseError(error.response!, error);
      default:
        return Failure("Something went wrong", code: error.response?.statusCode, exception: error);
    }
  }

  static Failure _handleResponseError(Response response, DioException error) {
    switch (response.statusCode) {
      case 400:
        return Failure("Bad request", code: 400, exception: error);
      case 401:
        return Failure("Unauthorized", code: 401, exception: error);
      case 403:
        return Failure("Forbidden", code: 403, exception: error);
      case 404:
        return Failure("Not found", code: 404, exception: error);
      case 500:
        return Failure("Internal server error", code: 500, exception: error);
      default:
        return Failure("Unknown error occurred", code: response.statusCode, exception: error);
    }
  }
}
