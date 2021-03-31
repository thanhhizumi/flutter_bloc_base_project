import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_base_project/common/user_data_manager/user_data_manager.dart';
import 'package:flutter_bloc_base_project/core_service/request_model/request_model.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

enum Environment {
  production,
  perfomance,
  development,
}

extension EnvironmentX on Environment {
  String get serverURL {
    switch (this) {
      case Environment.production:
        return 'http://134.209.106.223:1806/api';
      case Environment.perfomance:
        return 'http://134.209.106.223:1806/api';
      case Environment.development:
        return 'http://134.209.106.223:1806/api';
      default:
        return null;
    }
  }
}

class ApiService {
  final http.Client httpClient;
  Environment _environment;

  ApiService({
    @required this.httpClient,
  }) : assert(httpClient != null) {
    if (kDebugMode) {
      _environment = Environment.development;
    } else if (kReleaseMode) {
      _environment = Environment.production;
    } else {
      _environment = Environment.perfomance;
    }
  }

  Future<dynamic> send(RequestModel request) async {
    switch (request.method) {
      case RequestMethod.postMethod:
        return await requestPost(request);
        break;
      case RequestMethod.getMethod:
        return await requestGet(request);
        break;
      case RequestMethod.putMethod:
        return await requestPut(request);
        break;
    }
  }

  Future<dynamic> requestPost(RequestModel request) async {
    final url = '${_environment.serverURL}${request.route}';
    // final accessToken = await UserDataManager.getAccessToken();
    final accessToken = '';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final response =
        await httpClient.post(url, headers: headers, body: request.params);
    final repsonseBody = jsonDecode(response.body);
    return repsonseBody;
  }

  Future<dynamic> requestPut(RequestModel request) async {
    final url = '${_environment.serverURL}${request.route}';
    // final accessToken = await UserDataManager.getAccessToken();
    final accessToken = '';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final response =
        await httpClient.put(url, headers: headers, body: request.params);
    final repsonseBody = jsonDecode(response.body);
    return repsonseBody;
  }

  Future<dynamic> requestGet(RequestModel request) async {
    final url = '${_environment.serverURL}${request.route}';
    // final accessToken = await UserDataManager.getAccessToken();
    final accessToken = '';
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(
      url,
      headers: headers,
    );
    final repsonseBody = jsonDecode(response.body);
    return repsonseBody;
  }

  // Future<dynamic> uploadFile(RequestModel request) async {
  //   var uri = Uri.parse('${_environment.serverURL}${request.route}');
  //   var requestUpload = http.MultipartRequest('POST', uri);
  //   requestUpload.fields['shopId'] = userId;
  //   requestUpload.files.add(http.MultipartFile(
  //       'thumbFile', _image.readAsBytes().asStream(), _image.lengthSync(),
  //       filename: _image.path.split("/").last));
  //   http.Response response =
  //       await http.Response.fromStream(await requestUpload.send());
  //   final repsonseBody = jsonDecode(response.body);
  //   return repsonseBody;
  // }
}
