import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http_basics/model/user.dart';
import 'package:http/http.dart' as http;

import '../util/conflict.dart' as c;

class FollowersScreen extends StatefulWidget {
  const FollowersScreen({Key? key}) : super(key: key);

  @override
  State<FollowersScreen> createState() => _FollowersScreenState();
}

class _FollowersScreenState extends State<FollowersScreen> {
  List<User> users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  fetchUsers() async {
    final endpoint = "https://jsonplaceholder.typicode.com/users";
    final uri = Uri.parse(endpoint);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final List decoded = json.decode(body);

        users = decoded.map<User>((e) => User.convertFromJson(e)).toList();
        setState(() {});
      }
    } on http.ClientException catch (e) {
      print(e.message);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final User user = users[index];

            return ListTile(
              leading: Image.network(""),
              title: Text(user.name),
              trailing: MaterialButton(
                onPressed: () {},
                child: Text("Follow"),
                color: Colors.blue,
              ),
            );
          }),
    );
  }
}
