abstract class DataFetchState {
  final List data;
  DataFetchState({this.data = const []});
}

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
  DataFetchSuccess({required this.data}) : super(data: data);
}

/// Loading More Data - Infinite Scroll view or lazy loading
/// Error in loading more data
/// Success in loading more data

class LoadingMoreData extends DataFetchState {
  final List data;
  LoadingMoreData({required this.data}) : super(data: data);
}

class LoadingMoreError extends DataFetchState {
  final List data;
  final String errorMessage;
  LoadingMoreError({required this.data, required this.errorMessage})
      : super(data: data);
}

/// Data refreshing
/// Error in data refreshing
/// Success in data refreshing
