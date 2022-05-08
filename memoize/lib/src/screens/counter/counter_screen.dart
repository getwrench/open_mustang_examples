import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mustang_widgets/mustang_widgets.dart';

import 'counter_service.service.dart';
import 'counter_state.state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MustangScreen<CounterState>(
      state: CounterState(context: context),
      fetchData: CounterService().memoizedGetInitData,
      builder: (BuildContext context, CounterState state) {
        if (state.counter.busy) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return _body(state, context);
      },
    );
  }

  Widget _body(CounterState? state, BuildContext context) {
    int counter = state!.counter.value;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memoize API calls'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$counter'),
            ),
            ElevatedButton(
              onPressed: CounterService().increment,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}
