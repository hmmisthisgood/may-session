import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http_basics/model/user.dart';
import 'package:http/http.dart' as http;

import '../util/conflict.dart' as c;

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key, this.username}) : super(key: key);
  final username;

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  List<User> users = [];
  bool isLoading = true;
  bool hasErrorOccurred = false;
  String errorMessage = "";

  final image =
      "https://cdn.pixabay.com/photo/2020/07/08/04/07/sea-5382487_1280.jpg";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    final endpoint = "https://11111jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(endpoint);

    double some = 10.25;

    some.toStringAsFixed(2);
    try {
      isLoading = true;
      setState(() {});
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final List decoded = json.decode(body);

        users = decoded.map<User>((e) => User.convertFromJson(e)).toList();
        isLoading = false;
        setState(() {});
      }
    } on Exception catch (e) {
      print(e);
      isLoading = false;
      hasErrorOccurred = true;
      errorMessage = e.toString();
      setState(() {});
    } catch (e, s) {
      print(e);
      print(s);
      isLoading = false;
      hasErrorOccurred = true;
      errorMessage = e.toString();

      setState(() {});
    }
  }

  Widget buildBody() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (hasErrorOccurred) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("An error has occurred. Click button to refrsh"),
            ),
            IconButton(
                onPressed: () {
                  fetchUsers();
                },
                icon: Icon(
                  Icons.refresh,
                  color: Colors.blue,
                )),
          ],
        ),
      );
    }
    return ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final User user = users[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  // color: Colors.green,
                  borderRadius: BorderRadius.circular(40),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              title: Text(
                user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              // subtitle: Container(),
              trailing: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 30,
                child: Text(
                  "Follow",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                color: Colors.blue,
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(body: buildBody());
  }
}
