import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;
import 'environment.dart';

class ApiBaseHelper {
  static final String _baseUrl = Environment.apiUrl;
  // final BaseStore baseStore = GetIt.I<BaseStore>();

  http.Client client = http.Client();

  static Future<dynamic> get({required String endpoint}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.get(url, headers: {});
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  static Future<dynamic> post(
      {required String endpoint, required String body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.post(url, headers: {}, body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  static Future<dynamic> put({required String endpoint, String? body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.put(url, headers: {}, body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  static Future<dynamic> patch(
      {required String endpoint, required String body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.patch(url, headers: {}, body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  static Future<dynamic> delete(
      {required String endpoint, String? body}) async {
    http.Response response;
    try {
      var url = Uri.parse('$_baseUrl$endpoint');
      response = await http.delete(url, headers: {}, body: body);
    } on TimeoutException {
      throw http.ClientException;
    } on SocketException {
      throw http.ClientException;
    }
    return response.body;
  }

  static Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
