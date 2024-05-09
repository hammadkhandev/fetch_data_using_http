
import 'package:flutter/material.dart';
import 'package:making_http_request/http/http_helper.dart';
import 'package:making_http_request/models/user_model.dart';

class UsersFutureScreen extends StatefulWidget {
  const UsersFutureScreen({super.key});

  @override
  State<UsersFutureScreen> createState() => _UsersFutureScreenState();
}

class _UsersFutureScreenState extends State<UsersFutureScreen> {
  final _http = httpHelper.httpInstant;

  late Future<List<GetUser>> usersList;

  @override
  void initState() {
    usersList = _http.getUsersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Users Data using Future Builder"),),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder(future: usersList,
            builder: (context, snapshot){
          if(snapshot.hasData){
           return Expanded(
             child: ListView.separated(itemBuilder: (context,index)=>ListTile(
               title: Text(snapshot.data![index].title.toString().toUpperCase()),
               subtitle: Text(snapshot.data![index].body.toString()),
             ),
                 separatorBuilder: (context, index) => const SizedBox.shrink(), itemCount: snapshot.data!.length),
           );
          }
          if(snapshot.hasError){
            return const Center(child: Text("Error"),);
          }
          return Center(child: Text(snapshot.connectionState.name));
        }
        ),
      ],
    ),
    );
  }
}
