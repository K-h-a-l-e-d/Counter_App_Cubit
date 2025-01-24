import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(CounterInitial(0)); //setting the initial counter value to 0

  void incrementCounter() {
    //incrementing current state value then emitting the updated value to the state
    emit(CounterValue(state.count + 1));
    //checking if the current state value is 10 or -10, if true the state  CounterValueIsPostiveOrNegative10 is called
    //which will be used in a listener in counter app page to display a snackBar
    if (state.count == 10 || state.count == -10) {
      emit(CounterValueIsPostiveOrNegative10(state.count));
    }
  }

  void decrementCounter() {
    emit(CounterValue(state.count - 1));

    if (state.count == 10 || state.count == -10) {
      emit(CounterValueIsPostiveOrNegative10(state.count));
    }

    //checking if the current state value is -1 indicating that we
    //have reached negative values, if true the state  CounterValueIsNegative is called
    //which will be used in a listener in counter app page to display a snackBar
    if (state.count == -1) {
      emit(CounterValueIsNegative(state.count));
    }
  }
}
