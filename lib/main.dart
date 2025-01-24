import 'package:counter_app/views/cubits/counter/counter_cubit.dart';
import 'package:counter_app/views/cubits/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'views/counter_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, themeData) {
          return MaterialApp(
            title: 'Counter App',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: BlocProvider(
              create: (context) => CounterCubit(),
              child: const CounterAppPage(title: 'Counter App'),
            ),
          );
        },
      ),
    );
  }
}
