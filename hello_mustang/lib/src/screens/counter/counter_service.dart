import 'package:hello_mustang/src/models/counter.model.dart';
import 'package:mustang_core/mustang_core.dart';

import 'counter_service.service.dart';
import 'counter_state.dart';

@ScreenService(screenState: $CounterState)
abstract class $CounterService {
  Future<void> memoizedGetData() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    if (counter.clearScreenCache) {
      clearMemoizedScreen(reload: false);
      counter = counter.rebuild(
        (b) => b..clearScreenCache = false,
      );
      updateState1(counter, reload: false);
    }
    return memoizeScreen(getData);
  }

  Future<void> getData({
    bool showBusy = true,
  }) async {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    if (showBusy) {
      counter = counter.rebuild(
        (b) => b
          ..busy = true
          ..errorMsg = '',
      );
      updateState1(counter);
    }
    // Add API calls here, if any
    counter = counter.rebuild((b) => b..busy = false);
    updateState1(counter);
  }

  void clearCacheAndReload({bool reload = true}) {
    clearMemoizedScreen(reload: reload);
  }

  void increment() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
    updateState1(counter);
  }
}
