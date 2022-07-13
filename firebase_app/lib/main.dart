import 'package:firebase_app/bloc/cubit/auth_cubit.dart';
import 'package:firebase_app/screen/homepage.dart';
import 'package:firebase_app/screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.pink),
      home: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        // {
        //   AuthCubit authCubit = new AuthCubit();
        //   return authCubit;
        // },
        child: LoginScreen(),
      ),
    );
  }
}
