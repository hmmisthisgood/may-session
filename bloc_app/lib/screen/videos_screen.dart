import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import '../model/video.dart';
import '../widget/app_env.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final ScrollController scrollController = ScrollController();
  // final refrshController = RefreshController();
  int count = 0;

  @override
  void initState() {
    super.initState();

    askPermissions();

    BlocProvider.of<DataFetchCubit>(context).fetchVideos();
    RepositoryProvider.of<Test>(context).doSomething();
    // context.read<DataFetchCubit>().fetchVideos(); // both this and above line are same

    scrollController.addListener(() {
      final ScrollPosition position = scrollController.position;
      final pixes = position.pixels;

      // print(position.axis);
      // print(position.axisDirection);
      // print("max: " + position.maxScrollExtent.toString());
      // print("min:" + position.minScrollExtent.toString());

      if (pixes <= position.minScrollExtent && position.atEdge) {
        print("I am at start");
      }
      if (pixes >= position.maxScrollExtent && position.atEdge) {
        print("I am at the end");
        count++;
        print(count);
        context.read<DataFetchCubit>().loadMoreVideos();
      }
      print(position.atEdge);
    });
  }

  navigate() {
    Navigator.pushNamed(context, "/test");
  }

  askPermissions() async {
    final locPermission = await Permission.location.status;

    final bluetoothPerm = await Permission.bluetooth;
    bluetoothPerm.request();
    Permission.location.request();

    if (locPermission.isDenied) {
      Permission.location.request();
    }

    Permission.storage.request();
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    final appEnv = AppEnv.of(context);

    print("app env is :" + appEnv.env);

    return Scaffold(
      appBar: AppBar(title: Text(AppEnv.of(context).env)),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // final result = await FilePicker.platform.pickFiles();

          AppEnv.of(context).changeEnv("dev");
          // result.files
        },
      ),
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
            if (state is DataFetchSuccess ||
                state is LoadingMoreData ||
                state is LoadingMoreError) {
              return Column(
                children: [
                  Expanded(
                    child: new ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          Video currentVideo = state.data[index];
                          return Image.network(currentVideo.userImageUrl);
                        }),
                  ),
                  SizedBox(height: 19),
                  if (state is LoadingMoreData) CircularProgressIndicator()
                ],
              );
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
/// 
/// 4. BlocProvider
/// 5. RepostoryProvider
/// 6. MultiBlocProvider
/// 
/// 7. MultiRepositoryProvider



//  for refrshing data
// 1. pull to refrsh: pub packagte
//2. RefreshIndicator