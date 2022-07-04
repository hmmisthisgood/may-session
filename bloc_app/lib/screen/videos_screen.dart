import 'package:bloc_app/bloc/data_fetch/data_fetch_cubit.dart';
import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/video.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({Key? key, required this.screenTitle}) : super(key: key);
  final String screenTitle;
  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final DataFetchCubit videoCubit = DataFetchCubit();
  @override
  void initState() {
    super.initState();
    videoCubit.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text(widget.screenTitle)),
      body: Center(
        child: BlocConsumer(
          bloc: videoCubit,
          listener: (context, state) {
            ///

            if (state is DataFetchError) {
              ////
            }
          },
          builder: (context, state) {
            print(state);
            if (state is DataFetchLoading) {
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
