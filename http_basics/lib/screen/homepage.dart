import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var dataFromServer = [];
  @override
  void initState() {
    print("1. init state called");

    fetchDataFromServer();
  }

  fetchDataFromServer() {
    final url = "http://jsonplaceholder.typicode.com/posts";

    print("Fetching data from server");

    final uri = Uri.parse(url);
    api.get(uri).then((res) {
      print("Data fetch success");

      print(res.statusCode);

      final List decoded = json.decode(res.body);
      print(decoded);
      dataFromServer = decoded;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    super.dispose();
    print("disposed");
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    // res.body;

    return Scaffold(
      body: ListView.builder(
        itemCount: dataFromServer.length, //100
        itemBuilder: (context, index) {
          final item = dataFromServer[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey.withOpacity(0.3),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item["title"],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(item["body"]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
