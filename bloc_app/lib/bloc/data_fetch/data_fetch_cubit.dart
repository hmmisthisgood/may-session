import 'package:bloc_app/bloc/data_fetch/data_fetch_state.dart';
import 'package:bloc_app/model/video.dart';
import 'package:bloc_app/utils/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class DataFetchCubit extends Cubit<DataFetchState> {
  DataFetchCubit({required this.apiUrl}) : super(DataInitial());

  final String apiUrl;
  final Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
  // final endpoint = "https://pixabay.com/api/videos";

  int _currentPage = 1;

  List<Video> allVideos = [];

  fetchVideos() async {
    emit(DataFetchLoading());

    try {
      final response = await _dio.get(apiUrl, queryParameters: {
        "key": PixabayApiKey,
        "q": "cars",
        "per_page": 5
      }); // page =1

      final statusCode = response.statusCode; //200, 400, 401, 500

      final body = response.data; // equivalent of response.body

      // final decoded = json.decode(body); // not necessary to decode the reposnde data
      final List hits = body['hits'];
      print(hits);
      final List<Video> tempVideos =
          hits.map((e) => Video.convertFromJson(e)).toList();
      // videosList = tempVideos; // 0x1211
      allVideos.addAll(tempVideos);

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

  loadMoreVideos() async {
    emit(LoadingMoreData(data: allVideos));
    _currentPage++; //3

    try {
      final response = await _dio.get(apiUrl, queryParameters: {
        "key": PixabayApiKey,
        "q": "cars",
        "page": _currentPage,
        "per_page": 5
      });
      final body = response.data; // equivalent of response.body

      // final decoded = json.decode(body); // not necessary to decode the reposnde data
      final List hits = body['hits'];
      print(hits);
      final List<Video> moreVideos =
          hits.map((e) => Video.convertFromJson(e)).toList(); //5
      // videosList = tempVideos; // 0x1211
      allVideos.addAll(moreVideos);

      emit(DataFetchSuccess(data: allVideos));
    } on DioError catch (e) {
      print(e.toString());
      emit(LoadingMoreError(errorMessage: e.message, data: allVideos));
    } catch (e, s) {
      print(e.toString());
      print(s);
      emit(LoadingMoreError(errorMessage: e.toString(), data: allVideos));
    }
  }
}
