import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class URLS {
  static const String BASE_URL = 'http://10.0.2.2:8080/StudentRest/webresources/student';
}

class ApiService{
  static Future<List<dynamic>> getEstudantes() async {
    final response = await http.get('${URLS.BASE_URL}/all',headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {      
      return json.decode(response.body);
    } else {      
      return null;
    }
    
  }

  static Future<bool> removerEstudate() async {
    String url = '${URLS.BASE_URL}/remove/${000}/${000})';
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await get(url,headers:headers);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> addEmpregado(body) async {
    Map<String, String> headers = {"Content-type": "application/json"};
    final response = await http.post('${URLS.BASE_URL}/create',headers: headers, body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool>makePostRequest() async {
  String url = '${URLS.BASE_URL}/create';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"name": "TestePOST", "rg": 1234, "grade": 9, "login": {"user": "007", "password": "007"}}';
  final response = await post(url, headers: headers, body: json);
  if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
}
}
