import 'package:memoize/src/models/counter.model.dart';
import 'package:mustang_core/mustang_core.dart';

import 'counter_service.service.dart';

@screenService
abstract class $CounterService {
  Future<void> memoizedGetInitData() {
    return memoizeScreen(getInitData);
  }

  Future<void> getInitData() async {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild(
      (b) => b..busy = true,
    );
    updateState1(counter);

    // Mimicking API call
    await Future.delayed(const Duration(seconds: 4));
    counter = counter.rebuild(
      (b) => b..busy = false,
    );
    updateState1(counter);
  }

  void increment() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
    updateState1(counter);
  }
}
