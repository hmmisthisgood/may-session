import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:bloc_app/model/video.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class DataFetchCubit extends Cubit<DataFetchState> {
  DataFetchCubit() : super(DataInitial());

  final Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

  fetchVideos() async {
    final endpoint = "https://pixabay.com/api/videos";

    emit(DataFetchLoading());

    try {
      final response = await _dio.get(endpoint, queryParameters: {
        "key": "24747090-95c20607d87e00f7bea20cb40",
        "q": "cars"
      });

      final statusCode = response.statusCode; //200, 400, 401, 500

      final body = response.data; // equivalent of response.body

      // final decoded = json.decode(body); // not necessary to decode the reposnde data
      final List hits = body['hits'];
      print(hits);
      final List<Video> tempVideos =
          hits.map((e) => Video.convertFromJson(e)).toList();
      // videosList = tempVideos; // 0x1211

      emit(DataFetchSuccess(data: tempVideos));
    } on DioError catch (e) {
      print(e.toString());
      emit(DataFetchError(errorMessage: e.message));
    } catch (e, s) {
      print(e.toString());
      print(s);
      emit(DataFetchError(errorMessage: e.toString()));
    }
  }
}
