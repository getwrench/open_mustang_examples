import 'package:events/src/screens/counter/counter_service.service.dart';
import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'counter_state.state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This is to initialize stream subscription
    CounterService();

    return StateProvider<CounterState>(
      state: CounterState(),
      child: Builder(
        builder: (BuildContext context) {
          CounterState? state = StateConsumer<CounterState>().of(context);

          if (state?.counter.busy ?? false) {
            return const CircularProgressIndicator();
          }

          if (state?.counter.errorMsg.isNotEmpty ?? false) {
            Text(state?.counter.errorMsg ?? 'Unknown error');
          }

          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(CounterState? state, BuildContext context) {
    int counter = state?.counter.value ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$counter'),
            ),
          ],
        ),
      ),
    );
  }
}
