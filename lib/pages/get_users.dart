

import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';

class GetUsersScreen extends StatefulWidget {
  const GetUsersScreen({super.key});

  @override
  State<GetUsersScreen> createState() => _GetUsersScreenState();
}

class _GetUsersScreenState extends State<GetUsersScreen> {
  final _http = httpHelper.httpInstant;

  List<GetUser> usersList = <GetUser>[];

  bool isLoading = false;

  Future<void> getUser() async {
    isLoading =false;
    usersList= await _http.getUsersData();
  setState(() {
    isLoading =true;
  });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Users"),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: isLoading,
              replacement: const CircularProgressIndicator(),
              child: Expanded(
                child: ListView.builder(
                    itemCount: usersList.length,
                    itemBuilder: (context, index){
                  return  ListTile(
                    leading: const Icon(Icons.account_box_outlined),
                    title: Text(usersList[index].title.toString().toUpperCase(),),
                    subtitle: Text(usersList[index].body.toString()),
                    trailing: Text(usersList[index].id.toString()),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
