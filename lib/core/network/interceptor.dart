//FIXME old code

// import 'package:dio/dio.dart';
//
// class LoggingInterceptor extends Interceptor {
//   int _maxCharactersPerLine = 200;
//
//   @override
//   Future onRequest(RequestOptions options) {
//     //  print("--> ${options.method} ${options.path}");
//     //  print("Content type: ${options.contentType}");
//     //  print("<-- END HTTP");
//     return super.onRequest(options);
//   }
//
//   @override
//   Future onResponse(Response response) {
//     // print("<-- ${response.statusCode} ${response.request.method} ${response.request.path}");
//     String responseAsString = response.data.toString();
//     if (responseAsString.length > _maxCharactersPerLine) {
//       int iterations = (responseAsString.length / _maxCharactersPerLine).floor();
//       for (int i = 0; i <= iterations; i++) {
//         int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
//         if (endingIndex > responseAsString.length) {
//           endingIndex = responseAsString.length;
//         }
//         print(responseAsString.substring(i * _maxCharactersPerLine, endingIndex));
//       }
//     } else {
//       // print(response.data);
//     }
//     // print("<-- END HTTP");
//     return super.onResponse(response);
//   }
//
//   @override
//   Future onError(DioError err) {
//     // print("<-- Error -->");
//     // print(err.error);
//     // print(err.message);
//     return super.onError(err);
//   }
// }

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    // print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    print('RESPONSE PATH: ${response.requestOptions.path} ==> $response');
    return super.onResponse(response, handler);
  }

  @override
  Future onError(DioError err, ErrorInterceptorHandler handler) async {
    print(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    return super.onError(err, handler);
  }
}
