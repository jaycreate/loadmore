import 'dart:convert';
import 'package:dio/dio.dart';

var baseUrl = "";

Map<String, dynamic> dioErrorHandle(DioException error) {
  return {"success": false, "message": error.message};
}

class HTTPManager {
  BaseOptions baseOptions = BaseOptions(
    baseUrl: baseUrl,
    // connectTimeout: 30000,
    // receiveTimeout: 30000,
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  ///Setup Option
  BaseOptions exportOption(BaseOptions options) {
    options.headers["Authorization"] = "Bearer token";
    return options;
  }

  ///Post method
  Future<dynamic> post({
    required String url,
    Map<String, dynamic>? data,
    FormData? formData,
    Options? options,
    Function(num)? progress,
  }) async {
    BaseOptions requestOptions = exportOption(baseOptions);
    requestOptions.baseUrl = baseUrl;
    Dio dio = Dio(requestOptions);

    try {
      final response = await dio.post(
        url,
        data: jsonEncode(data ?? formData),
        options: options,
        onSendProgress: (sent, total) {
          if (progress != null) {
            progress((sent / total) / 0.01);
          }
        },
      );
      return response.data;
    } on DioException catch (error) {
      return dioErrorHandle(error);
    }
  }

  ///Get method
  Future<dynamic> get({
    required String url,
    Map<String, dynamic>? params,
    Options? options,
  }) async {
    BaseOptions requestOptions = exportOption(baseOptions);
    requestOptions.baseUrl = baseUrl;
    Dio dio = Dio(requestOptions);

    try {
      final response = await dio.get(
        url,
        queryParameters: params,
        options: options,
      );
      return response.data;
    } on DioException catch (error) {
      return dioErrorHandle(error);
    }
  }

  factory HTTPManager() {
    return HTTPManager._internal();
  }

  HTTPManager._internal();
}

HTTPManager httpManager = HTTPManager();
