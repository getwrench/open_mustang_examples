import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'counter2_state.state.dart';

class Counter2Screen extends StatelessWidget {
  const Counter2Screen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<Counter2State>(
      state: Counter2State(context: context),
      child: Builder(
        builder: (BuildContext context) {
          Counter2State? state = StateConsumer<Counter2State>().of(context);
          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(Counter2State? state, BuildContext context) {
    int counter = state?.timerEvent.value ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter #2'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Counter Screen # 2'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$counter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Previous Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
