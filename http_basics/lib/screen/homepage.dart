import 'dart:convert';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

import '../model/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var dataFromServer = [];
  List<Post> postsList = [];
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

      /// Map
      /// map
      final List<Post> converetedList = decoded.map<Post>((item) {
        final convertedPost = Post.convertJsonToDart(item);
        return convertedPost;
      }).toList();
      postsList = converetedList;

      print(decoded);
      dataFromServer = decoded;
      setState(() {});
    }).catchError((e) {
      print(e);
    });
  }

  postDataToServer() async {
    print("posting data to server");

    final url = "https://jsonplaceholder.typicode.com/posts/";
    final uri = Uri.parse(url);

    try {
      final data = await api.post(uri, body: {
        "userId": "12432",
        "title": "This is a random post from us",
        "body": "ohh this an awesomr post"
      });

      final secondData = await api.post(uri, body: data.body);
    } catch (e, s) {
////
      // api.post(uri, body: {
      //   "userId": "12432",
      //   "title": "This is a random post from us",
      //   "body": "ohh this an awesomr post"
      // }).then((res) {
      //   api.post(uri, body: res.body).then((e) {}).catchError((e) {});

      //   print("posted dat to server success!");
      //   print(res.statusCode);
      //   print(res.body);
      // }).catchError((e, s) {
      //   print(e);
      //   print(s);
      // });
    }
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
        itemCount: postsList.length, //100
        itemBuilder: (context, index) {
          // final item = dataFromServer[index];
          final item = postsList[index];
          return InkWell(
            onTap: () {
              postDataToServer();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey.withOpacity(0.3),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // item["title"],
                      item.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        // item["body"],
                        item.body),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
