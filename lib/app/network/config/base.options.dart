import 'package:dio/dio.dart';

class DioBaseOptions {
  static BaseOptions get options => BaseOptions(
    // baseUrl: NetworkConstants.baseUrl,
    baseUrl: "https://nikita-backend.onrender.com/api/v1",
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
    sendTimeout: const Duration(seconds: 10),
    followRedirects: true,
    validateStatus: (status) {
      // Accept 403 as a valid response if you want to handle it manually
      return status != null && status < 501;
    },
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 123'
    },
    
  );
}


class DioBaseOptions2 {
  static BaseOptions get options => BaseOptions(
    baseUrl: "",
    connectTimeout: const Duration(seconds: 100),
    receiveTimeout: const Duration(seconds: 100),
    sendTimeout: const Duration(seconds: 10),
    followRedirects: true,
    validateStatus: (status) {
      // Accept 403 as a valid response if you want to handle it manually
      return status != null && status < 500;
    },
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      // 'Authorization': 'Bearer 123'
    },
    
  );
}
