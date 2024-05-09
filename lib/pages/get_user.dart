


import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';

class GetSingleUser extends StatefulWidget {
  const GetSingleUser({super.key});

  @override
  State<GetSingleUser> createState() => _GetSingleUserState();
}

class _GetSingleUserState extends State<GetSingleUser> {
  final _http = httpHelper.httpInstant;
  late Future<GetUser> futureUser ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureUser = _http.getUserdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("fetch data using future builder"),
      elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ///get data using future builder
            FutureBuilder(future: futureUser, builder: (context, snapshot){
              if(snapshot.hasData){
                return ListTile(
                  title: Text(snapshot.data!.title.toString().toUpperCase()),
                  subtitle: Text(snapshot.data!.body.toString()),
                );
              }else if(snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            }
            ),
          ],
        ),
      ),
    );
  }
}


