import 'package:flutter/material.dart';

class MiscScreen extends StatelessWidget {
  const MiscScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                'assets/image/wall.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              )),
          title: Text("Madan Bhandari"),
          subtitle: Text("Tulsipur, Dang"),
          trailing: GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25, horizontal: 10),
                        child:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          Text(
                            "Are you sure you want to delete the user?",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                height: 30,
                                color: Colors.red,
                                child: Text(
                                  "No",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              MaterialButton(
                                height: 30,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                color: Colors.green,
                                child: Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          )
                        ]),
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}

/// leading= prefix
/// trailing =suffix