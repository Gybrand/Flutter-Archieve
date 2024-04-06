import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/bloc/counter_bloc.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/bloc/counter_event.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BLocPage extends StatefulWidget {
  const BLocPage({super.key});

  @override
  State<BLocPage> createState() => _BLocPageState();
}

class _BLocPageState extends State<BLocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('BLoc Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Column(
                children: [
                  Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Increment());
                        },
                        child: const Text('Increment'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CounterBloc>().add(Decrement());
                        },
                        child: const Text('Decrement'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
