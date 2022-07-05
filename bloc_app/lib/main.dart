import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/screen/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => DataFetchCubit()),
      ],
      child: RepositoryProvider(
        create: (_) => Test(),
        child: MaterialApp(
          home: VideosScreen(
            screenTitle: "videos",
          ),
        ),
      ),
    );
  }
}

class Test {
  doSomething() {}
}
