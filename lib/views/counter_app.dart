import 'package:counter_app/utils/dialog.dart';
import 'package:counter_app/utils/snackbar.dart';
import 'package:counter_app/views/cubits/counter/counter_cubit.dart';
import 'package:counter_app/views/cubits/themes/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterAppPage extends StatefulWidget {
  const CounterAppPage({super.key, required this.title});

  final String title;

  @override
  State<CounterAppPage> createState() => _CounterAppPageState();
}

class _CounterAppPageState extends State<CounterAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            //listening for (negative values or reaching 10/-10) state classes
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state is CounterValueIsPostiveOrNegative10) {
                  showSnackBar(
                    context,
                    msg: 'Counter has reached ${state.count}',
                  );
                }

                if (state is CounterValueIsNegative) {
                  showDialogMsg(
                    context,
                    title: "Counter has reached Negative Values!",
                  );
                }
              },
              builder: (context, state) {
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        spacing: 10,
        children: [
          Expanded(
            child: SwitchListTile(
              value: context
                  .read<ThemeCubit>()
                  .darkModeFlag, //getter bool value obtained based on themeData
              title: Text('Dark Mode'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.symmetric(horizontal: 25),
              //calling toggle dark theme function when switch is pressed
              onChanged: (value) =>
                  context.read<ThemeCubit>().toggleDarkTheme(),
            ),
          ),
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().decrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: context.read<CounterCubit>().incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
