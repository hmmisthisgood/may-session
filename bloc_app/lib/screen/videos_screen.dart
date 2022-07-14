import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../main.dart';
import '../model/video.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final ScrollController scrollController = ScrollController();
  int count = 0;

  @override
  void initState() {
    super.initState();
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
                  physics: BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    Video currentVideo = state.data[index];
                    return Image.network(currentVideo.userImageUrl);
                  });
            }

            if (state is LoadingMoreData) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        controller: scrollController,
                        itemCount: state.data.length,
                        itemBuilder: (context, index) {
                          Video currentVideo = state.data[index];
                          return Image.network(currentVideo.userImageUrl);
                        }),
                  ),
                  SizedBox(height: 19),
                  CircularProgressIndicator()
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

