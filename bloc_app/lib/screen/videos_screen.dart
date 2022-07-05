import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';
import '../model/video.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<DataFetchCubit>(context).fetchVideos();
    RepositoryProvider.of<Test>(context).doSomething();
    // context.read<DataFetchCubit>().fetchVideos(); // both this and above line are same
  }

  navigate() {
    Navigator.pushNamed(context, "/test");
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      appBar: AppBar(title: Text(widget.screenTitle)),
      body: Center(
        child: BlocConsumer<DataFetchCubit, DataFetchState>(
          listener: (context, state) {
            ///

            if (state is DataFetchError) {
              ////
              Fluttertoast.showToast(msg: state.errorMessage);
            }

            if (state is DataFetchSuccess) {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) => Scaffold(
              //         appBar: AppBar(
              //           title: Text("new screen"),
              //         ),
              //         body: Text(state.data.toString()),
              //       ),
              //     ));

              Fluttertoast.showToast(msg: "Yay, data fetch success!");
            }
          },
          builder: (context, state) {
            print(state);
            if (state is DataFetchLoading || state is DataInitial) {
              return CircularProgressIndicator();
            }
            if (state is DataFetchError) {
              return Text(
                state.errorMessage,
                textAlign: TextAlign.center,
              );
            }
            if (state is DataFetchSuccess) {
              return ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    Video currentVideo = state.data[index];
                    return Image.network(currentVideo.userImageUrl);
                  });
            }
            return Text("Unknown state");
          },
        ),
      ),
    );
  }
}

/// 1 . BlocBuidler >> done
/// 2. BlocListener
/// 3. BlocConsumer >> combined form of 1 and 2.
/// 4. BlocProvider
/// 5. RepostoryProvider
/// 6. MultiBlocProvider
/// 7. MultiRepositoryProvider
