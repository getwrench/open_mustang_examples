import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'counter_state.state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<CounterState>(
      state: CounterState(context: context),
      child: Builder(
        builder: (BuildContext context) {
          CounterState? state = StateConsumer<CounterState>().of(context);
          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(CounterState? state, BuildContext context) {
    int counter = state?.timerEvent.value ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter#1'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Counter Screen # 1'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$counter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/counter2');
              },
              child: const Text('Next Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
