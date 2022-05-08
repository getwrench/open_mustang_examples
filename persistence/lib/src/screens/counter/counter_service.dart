import 'dart:async';

import 'package:mustang_core/mustang_core.dart';
import 'package:persistence/src/models/counter.model.dart';

import 'counter_service.service.dart';

@screenService
abstract class $CounterService {
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
