import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);
  int initialValue = 0;
  increase() {
    initialValue++;

    emit(initialValue);
  }

  decrease() {
    initialValue--;
    emit(initialValue);
  }
}
