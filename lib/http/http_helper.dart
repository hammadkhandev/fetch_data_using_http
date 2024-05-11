import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:making_http_request/models/user_model.dart';

class httpHelper {
  httpHelper._();
  static final httpHelper httpInstant  = httpHelper._();

  Future<GetUser>? _getUserData;

  Future<List<GetUser>>? _getUsersData;

  Future<GetUser> getUserdata() {
    if(_getUserData == null){
      _getUserData = getUserPost();
      return _getUserData as Future<GetUser>;
    } else{
      return _getUserData as Future<GetUser>;
    }
  }

  Future<List<GetUser>> getUsersData() {
    if(_getUsersData == null){
      _getUsersData = getUserPostList();
    return _getUsersData  as Future<List<GetUser>> ;
    }
    else{
      return _getUsersData as Future<List<GetUser>> ;
    }
  }

  Future<GetUser> getUserPost() async {
    final client = RetryClient(http.Client());
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

  Future<List<GetUser>> getUserPostList() async {
    final client = RetryClient(http.Client());
    try{
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var jsonResponse = await client.get(url);
      printJsonResponse(jsonResponse);
      if(jsonResponse.statusCode==200){
        var usersList =jsonDecode(jsonResponse.body) as List ;
        List<GetUser> getUsersList =  usersList.map((list) => GetUser.fromJson(list)).toList();
        return getUsersList;
      }else{
        throw Exception("Failed to load user data ${jsonResponse.request.toString()}");
      }
    } finally{
      client.close();
    }
  }

  Future postUser(GetUser user) async {
    final client = RetryClient(http.Client());
    try{
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var header =<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var body = jsonEncode(user.toJson());
      var response = await client.post(
          url,
          headers: header,
          body: body
      );
      printJsonResponse(response);
      if(response.statusCode ==201){
        return true;
      }else{
        return false;
      }
    }finally{
      client.close();
    }


  }

  Future deleteUser(String id) async {
    final client = RetryClient(http.Client());
    try{
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/$id");
      var header =<String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      };
      var response = await client.delete(
          url,
          headers: header,
      );
      printJsonResponse(response);
      if(response.statusCode ==201){
        return true;
      }else{
        return false;
      }
    }finally{
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