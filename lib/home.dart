
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:making_http_request/pages/api_pagination.dart';
import 'package:making_http_request/pages/delete_user.dart';
import 'package:making_http_request/pages/get_user.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/pages/get_user_on_click.dart';
import 'package:making_http_request/models/user_model.dart';
import 'package:making_http_request/pages/get_users.dart';
import 'package:making_http_request/pages/get_users_future_builder.dart';
import 'package:making_http_request/pages/images_page.dart';
import 'package:making_http_request/pages/infinite_scrolling.dart';
import 'package:making_http_request/pages/post_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Fetch Data Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///get data using future builder
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const GetSingleUser()));
           }, child: const Text("Get User data")
            ),
            SizedBox(height: 10,),
            ///get data on Click
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const GetUserScreen()));
           }, child: const Text("Get user data on click")
            ),
            SizedBox(height: 10,),
            ///get list of user on init method
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const GetUsersScreen()));
           }, child: const Text("Get users")
            ),
            SizedBox(height: 10,),
            ///get list of user on init method
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (context)=> const UsersFutureScreen()));
           }, child: const Text("Future users")
            ),
            SizedBox(height: 10,),
            ///post list of user on init method
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const PostUser()));
            }, child: const Text("Post User data")
            ),
            SizedBox(height: 10,),
            ///post list of user on init method
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const DeleteUser()));
            }, child: const Text("Delete User data")
            ),
            SizedBox(height: 10,),
            ///Infinite Scrolling basic concept
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  InfiniteScrolling()));
            }, child: const Text("Infinite Scrolling")
            ),
            SizedBox(height: 10,),
            ///Infinite Scrolling || api pagination
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  APIPagination()));
            }, child: const Text("API Pagination")
            ),
            SizedBox(height: 10,),
            ///get using http Images Pages
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>  const ImagePage()));
            }, child: const Text("Images Page")
            ),
          ],
        ),
      ),
    );
  }
}
