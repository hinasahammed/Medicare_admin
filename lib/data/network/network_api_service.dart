import 'dart:convert';
import 'dart:io';

import 'package:medicare_admin/data/app_exception.dart';
import 'package:medicare_admin/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw ServerException('Server error');
    }
  }

  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw const SocketException('No internet');
    } on RequestTimeoutException {
      throw RequestTimeoutException('Time out');
    }
  }

  @override
  Future postApi(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw const SocketException('No internet');
    } on RequestTimeoutException {
      throw RequestTimeoutException('Time out');
    }
  }

  @override
  Future deleteApi(String url) async {
    dynamic responseJson;
    try {
      final response = await http.delete(
        Uri.parse(url),
      );
       responseJson = returnResponse(response);
      return responseJson;
    } on SocketException {
      throw const SocketException('No internet');
    } on RequestTimeoutException {
      throw RequestTimeoutException('Time out');
    }
  }
}
