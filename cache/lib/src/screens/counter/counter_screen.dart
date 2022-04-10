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
      state: CounterState(context: context),
      child: Builder(
        builder: (BuildContext context) {
          CounterState? state = StateConsumer<CounterState>().of(context);
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) => CounterService().memoizedGetData(),
          );

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
    int value = state?.counter.value ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cache'),
      ),
      body: RefreshIndicator(
        onRefresh: () => CounterService().getData(showBusy: false),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('$value'),
            ),
            ElevatedButton(
              onPressed: CounterService().incrementValue,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () => _cacheState(context),
              child: const Text('Cache current value'),
            ),
            ElevatedButton(
              onPressed: () => _restoreState(),
              child: const Text('Restore cached value'),
            ),
            ElevatedButton(
              onPressed: () => _clearCache(),
              child: const Text('Clear cached value'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _cacheState(BuildContext context) async {
    await CounterService().cacheCurrentValue();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cached')),
    );
  }

  Future<void> _restoreState() async {
    await CounterService().restoreValueFromCache();
  }

  Future<void> _clearCache() async {
    await CounterService().clearCachedState();
  }
}
