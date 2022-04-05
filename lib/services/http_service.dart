import 'dart:convert';
import 'package:http/http.dart';
import '../models/model.dart';



class Network {
  static String BASE = "dummy.restapiexample.com";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* Http Apis */

  static String API_LIST = "/api/v1/employees";
  static String API_ONE = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}


  /* Http Requests */

  static Future<String> GET(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> GETOne(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }





  static Future<String> POST(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> PUT(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "null";
    }
  }

  static Future<String> DEL(String api, Map<String, String> params) async {
    var uri = Uri.http(BASE, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }else {
      return "Deleted";
    }
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age,
    });
    return params;
  }
  }