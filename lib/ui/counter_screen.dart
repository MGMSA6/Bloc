import 'package:bloc_example/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_example/blocs/counter_bloc/counter_event.dart';
import 'package:bloc_example/blocs/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Counter Bloc Example", style: TextStyle(fontSize: 20)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 30),
            );
          }),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementCounter());
                  },
                  child: const Text(
                    "Increment",
                    style: TextStyle(fontSize: 15),
                  )),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementCounter());
                  },
                  child: const Text(
                    "Decrement",
                    style: TextStyle(fontSize: 15),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
