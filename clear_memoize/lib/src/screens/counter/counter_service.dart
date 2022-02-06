import 'package:counter/src/models/counter.model.dart';
import 'package:counter/src/screens/counter/counter_service.service.dart';
import 'package:mustang_core/mustang_core.dart';

import 'counter_state.dart';

@ScreenService(screenState: $CounterState)
abstract class $CounterService {
  Future<void> memoizedGetInitData() {
    return memoizeScreen(getInitData);
  }

  Future<void> getInitData() async {
    Counter counter = WrenchStore.get<Counter>() ?? Counter();
    counter = counter.rebuild(
      (b) => b..busy = true,
    );
    updateState1(counter);

    await Future.delayed(const Duration(seconds: 3));

    counter = WrenchStore.get<Counter>()!;
    counter = counter.rebuild(
      (b) => b..busy = false,
    );
    updateState1(counter);
  }

  void increment() {
    Counter counter = WrenchStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
    updateState1(counter);
  }
}
