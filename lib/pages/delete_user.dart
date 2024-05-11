





import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({super.key});

  @override
  State<DeleteUser> createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {

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

  Future<void> deleteUser() async {

    _http.deleteUser(getUsers.id.toString()).then((value) => {
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
        title: const Text("Delete user data"),),
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
            ElevatedButton(onPressed: deleteUser, child: const Text("delete user")),

          ],
        ),
      ),
    );
  }
}
