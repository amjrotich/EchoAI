import 'package:virtualguide/virtualguide.dart';

final Dio dio = Dio();
CancelToken cancelToken = CancelToken();

class DioInterceptors {
  // For UserService Interceptors
  /// chatGPT API DOC : https://platform.openai.com/docs/guides/gpt -> Follow
  static Future<Dio> userServiceInterceptors(context) async {
    dio.interceptors.clear();
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (option, handler) async {
          option.headers["Content-Type"] = "application/json";
          option.headers["Authorization"] =
              "Bearer [Your GPT Key]";
          option.connectTimeout = const Duration(seconds: 60);
          option.receiveTimeout = const Duration(seconds: 60);
          return handler.next(option); //continue
        },
        onResponse: (response, handler) async {
          return handler.next(response); // continue
        },
        onError: (dioError, handler) async {
          return handler.next(dioError);
        },
      ),
    );
    return dio;
  }

  static void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Request cancelled by user');
    }
  }
}
