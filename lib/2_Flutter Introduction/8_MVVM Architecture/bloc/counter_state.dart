import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CounterState extends Equatable {
  int value;
  CounterState(this.value);

  @override
  List<Object?> get props => [value];
}
