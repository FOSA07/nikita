import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/exception/exception.dart';
import 'messages.dart';

part 'chat.g.dart';

@Riverpod(keepAlive: true)
class ChatNotifier extends _$ChatNotifier {

  final Dio _dio = Dio(GPTDioBaseOptions.options);

  Future chatMessage (String content) async {

    var response =
        await post('/chat/completions', data: {
        "model": "gpt-3.5-turbo",
        "messages": [
            {"role": "system", "content": "Your name is Anna, You are a wine sommelier giving great advice..."},
            {"role": "user", "content": content}
            // {"role": "user", "content": "What wine would you recommend with a steak dinner?"}
        ],
    });


  //   if (response.statusCode == 200) {
  //       final responseData = jsonDecode(response.body);
  //       return responseData['choices'][0]['message']['content'];
  //     } else {
  //       throw Exception("Failed to fetch response: ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     throw Exception("Error: $e");
  //   }
  // }

    print("this is result");
    print(response);
    print("End of result --------------------");

    return response.fold((failure) {
      return failure;
    }, (result) {
      // log(result.toString());
      try {
        ref.read(messageNotifierProvider.notifier).adder({
          "sender": "CHATGPT",
          "message": result.data['choices'][0]['message']['content']
        });
        print(result.data['choices'][0]['message']['content']);
        return result.data;
      } catch (e) {
        // log("An Error Occured");
        return "An error occured";
      }
    });
  }

  Future<Either<Failure, Response>> post(
    String path, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final result =
          await _dio.post(path, data: data, queryParameters: queryParameters);
      // print(result);
      
      if (result.statusCode == 200) {
        return Right(result);
      }

      return Left(Failure("Response Error"));
    } on DioException catch (e) {

      return Left(Failure(e.error!.toString()));
    } catch (e) {
      return Left(Failure(e.toString(), exception: e));
    }
  }


  @override
  build () {

  }
}


class GPTDioBaseOptions {
  static BaseOptions get options => BaseOptions(
    baseUrl: 'https://openrouter.ai/api/v1',
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
      'Authorization': 'Bearer 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'
    },
    
  );
}
