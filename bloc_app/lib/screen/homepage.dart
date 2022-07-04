import 'package:bloc_app/bloc/counter/counter_bloc.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  Homepage({Key? key}) : super(key: key);
  final CounterCubit cubit = CounterCubit();

  int count = 0;

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "you have pressed this button this many timees",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            BlocBuilder(
              bloc: cubit,
              builder: (context, state) {
                print(state);
                return Text(
                  state.toString(),
                  style: TextStyle(fontSize: 30),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: () {
              cubit.decrease();
            },
            child: Icon(Icons.exposure_minus_1),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: () {
              cubit.increase();
            },
            child: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    );
  }
}
