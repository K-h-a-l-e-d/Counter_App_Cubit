part of 'counter_cubit.dart';

@immutable
abstract class CounterState {
  final int count;

  const CounterState(this.count);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.count);
}

class CounterValue extends CounterState {
  const CounterValue(super.count);
}

class CounterValueIsPostiveOrNegative10 extends CounterState {
  const CounterValueIsPostiveOrNegative10(super.count);
}

class CounterValueIsNegative extends CounterState {
  const CounterValueIsNegative(super.count);
}
