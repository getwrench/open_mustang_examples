import 'package:counter/src/screens/counter/counter_service.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'counter_service.service.dart';
import 'counter_state.state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<CounterState>(
      state: CounterState(),
      child: Builder(
        builder: (BuildContext context) {
          CounterState? state = StateConsumer<CounterState>().of(context);

          SchedulerBinding.instance?.addPostFrameCallback(
            (_) => CounterService().memoizedGetInitData(),
          );

          if (state!.counter.busy) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(CounterState? state, BuildContext context) {
    int value = state!.counter.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$value'),
            ),
            ElevatedButton(
              onPressed: CounterService().increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: CounterService().clearMemoizedScreen,
              child: const Text('Reload'),
            ),
          ],
        ),
      ),
    );
  }
}
