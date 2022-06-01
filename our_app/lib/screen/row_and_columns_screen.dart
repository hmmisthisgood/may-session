import 'package:flutter/material.dart';

import '../widget/news_card.dart';

class RowAndColumnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Row and Column")),
      body: Container(
        // color: Colors.grey,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              NewsCard(), //150
              NewsCard(),
              Container(
                  height: 150,
                  width: 200,
                  margin: EdgeInsets.all(20), //40
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            offset: Offset(3, 3),
                            blurRadius: 10,
                            spreadRadius: 2),
                      ]
                      // shape: BoxShape.circle,
                      ),
                  child: Text("Conainer")
                  // Container(color: Colors.green),
                  ),
              Container(
                height: 200,
                width: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blue, Colors.pink],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              ),

              Container(
                height: 500,
                color: Colors.brown,
              )
              // Container(height: 50, width: 30, color: Colors.purple),
              // Container(height: 50, width: 30, color: Colors.pink),
              // Container(height: 50, width: 30, color: Colors.black),
              // Container(height: 50, width: 30, color: Colors.yellow),
            ],
          ),
        ),
      ),
    );
  }
}
