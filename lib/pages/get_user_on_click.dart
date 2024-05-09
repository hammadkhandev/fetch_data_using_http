import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';

class GetUserScreen extends StatefulWidget {
  const GetUserScreen({super.key});

  @override
  State<GetUserScreen> createState() => _GetUserScreenState();
}

class _GetUserScreenState extends State<GetUserScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Fetch data on click"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Visibility(
              visible: isLoading,
              child: ListTile(
                title: Text("${getUsers.title.toString().toUpperCase()}"),
                subtitle: Text("${getUsers.body.toString()}"),
              ),
            ),

            ElevatedButton(onPressed: getUserData,
                child: Text("Get data"))
          ],
        ),
      ),
    );
  }
}
