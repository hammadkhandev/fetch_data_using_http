
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:making_http_request/pages/get_user.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/pages/get_user_on_click.dart';
import 'package:making_http_request/user_model.dart';

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

          ],
        ),
      ),
    );
  }
}
