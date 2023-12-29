import 'package:dio/dio.dart';
import 'package:flutter_list2/api/http_manager.dart';
import 'package:flutter_list2/configs/application.dart';
import 'package:flutter_list2/model/model.dart';

class Api {
  //

  // Load user data
  static Future<dynamic> users(var page) async {
    String url =
        "${Application.listUrl}/default/sample-list-v1-list?page=$page";

    final result = await httpManager.get(
      url: url,
      options: Options(headers: <String, dynamic>{
        'x-api-key': Application.listApiKey,
      }),
    );

    return ResultApiModel.fromJson(result);
  }
}
