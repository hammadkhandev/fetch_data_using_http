

import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';
import 'package:making_http_request/main.dart';
class PostUser extends StatefulWidget {
  const PostUser({super.key});

  @override
  State<PostUser> createState() => _PostUserState();
}

class _PostUserState extends State<PostUser> {

  bool isLoading = false;
  final _http = httpHelper.httpInstant;
  var getUsers = GetUser();

  Future<void> getUserData () async {
    isLoading = false;
    getUsers =   await _http.getUserdata();
    setState(() {
      isLoading = true;
    });
  }

  Future<void> postUser() async {

   _http.postUser(getUsers).then((value) => {
/// this code for show message
   if(value){
   ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
         content: Text(" Successfully "),
       )
   ),
  }else{
     ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text(" Failed "),
           closeIconColor: Colors.red,
         )
     )
    }
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Post user data"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              title: Text(getUsers.title ?? " get user title"),
              subtitle: Text(getUsers.body ?? ""),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: getUserData, child: const Text("get user")),
            const SizedBox(height: 10,),
            ElevatedButton(onPressed: postUser, child: const Text("post user")),

          ],
        ),
      ),
    );
  }
}
