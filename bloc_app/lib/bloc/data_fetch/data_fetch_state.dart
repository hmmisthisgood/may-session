abstract class DataFetchState {}

class DataInitial extends DataFetchState {}

class DataFetchLoading extends DataFetchState {
  final String? message;
  DataFetchLoading({this.message});
}

class DataFetchError extends DataFetchState {
  final String errorMessage;

  DataFetchError({required this.errorMessage});
}

class DataFetchSuccess extends DataFetchState {
  final List data;
  DataFetchSuccess({required this.data});
}
