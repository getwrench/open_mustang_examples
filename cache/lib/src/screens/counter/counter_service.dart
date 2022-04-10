import 'package:cache/src/models/counter.model.dart';
import 'package:cache/src/models/serializers.dart' as app_serializer;
import 'package:mustang_core/mustang_core.dart';

import 'counter_service.service.dart';

@screenService
abstract class $CounterService {
  final String cacheKey = 'cache-example';

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

  void incrementValue() {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
    updateState1(counter);
  }

  Future<void> cacheCurrentValue() async {
    Counter counter = MustangStore.get<Counter>() ?? Counter();
    await addObjectToCache(cacheKey, counter);
  }

  Future<void> restoreValueFromCache() async {
    await MustangCache.restoreObjects(
      cacheKey,
      app_serializer.json2Type,
    );
    updateState();
  }

  Future<void> clearCachedState() async {
    await MustangCache.deleteObjects(cacheKey);
  }
}
