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
      builder: (BuildContext context, CounterState state) {
        return _body(state, context);
      },
    );
  }

  Widget _body(CounterState? state, BuildContext context) {
    int value = state?.counter.value ?? 0;
    int tempValue = state?.counter.tempValue ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Persistence'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$value'),
          ),
          ElevatedButton(
            onPressed: CounterService().incrementPersistedValue,
            child: const Text('Increment Persisted Value'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$tempValue'),
          ),
          ElevatedButton(
            onPressed: CounterService().incrementTempValue,
            child: const Text('Increment Temp Value'),
          ),
        ],
      ),
    );
  }
}
