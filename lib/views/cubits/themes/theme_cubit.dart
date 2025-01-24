import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.dark()); //setting initial dark theme value

//toggling the current state and emitting the toggled value to be the new state
  void toggleDarkTheme() {
    emit(state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark());
  }

  //creating a getter boolean value to be assigned to the value property in the Switch widget in counter app page
  bool get darkModeFlag => state == ThemeData.dark();
}
