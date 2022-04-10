import 'dart:async';

import 'package:mustang_core/mustang_core.dart';
import 'package:persistence/src/models/counter.model.dart';

import 'counter_service.service.dart';

@screenService
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

  void incrementPersistedValue() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
    updateState1(counter);
  }

  void incrementTempValue() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..tempValue = (b.tempValue ?? 0) + 1);
    updateState1(counter);
  }
}
