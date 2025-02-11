import 'package:dio/dio.dart';

import '../../utils/constant/network.constant.dart';

class DioBaseOptions {
  static BaseOptions get options => BaseOptions(
    baseUrl: NetworkConstants.baseUrl,
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
