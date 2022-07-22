import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/screen/videos_screen.dart';
import 'package:bloc_app/utils/constants.dart';
import 'package:bloc_app/widget/app_env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppEnv(
        appName: "Our app",
        env: appProdEnv,
        baseUrl: devApiUrl,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => DataFetchCubit(apiUrl: AppEnv.of(context).baseUrl),
            ),
          ],
          child: RepositoryProvider(
            create: (_) => Test(),
            child: MaterialApp(
              home: VideosScreen(
                screenTitle: "videos",
              ),
            ),
          ),
        ));
  }
}

class Test {
  doSomething() {}
}
