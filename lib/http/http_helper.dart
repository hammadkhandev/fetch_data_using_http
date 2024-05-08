import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:making_http_request/user_model.dart';

class httpHelper {
  httpHelper._();
  static final httpHelper httpInstant  = httpHelper._();

  final client = RetryClient(http.Client());

  Future<GetUser>? _getUserData;

  Future<GetUser> getUserdata() {
    if(_getUserData == null){
      _getUserData = getUserPost();
      return _getUserData as Future<GetUser>;
    } else{
      return _getUserData as Future<GetUser>;
    }
  }

  Future<GetUser> getUserPost() async {
    try{
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    var jsonResponse = await client.get(url);
    printJsonResponse(jsonResponse);
    if(jsonResponse.statusCode==200){
      return GetUser.fromJson(jsonDecode(jsonResponse.body));
    }else{
      throw Exception("Failed to load user data ${jsonResponse.request.toString()}");
    }
    } finally{
      client.close();
    }
  }

  void printJsonResponse(http.Response jsonResponse) {
    if(kDebugMode){
      print(jsonResponse.body.toString());
      print(jsonResponse.statusCode.toString());
      print(jsonResponse.request.toString());
    }
  }

}