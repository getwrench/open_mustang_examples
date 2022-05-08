import 'package:cache/src/models/counter.model.dart';
import 'package:cache/src/models/serializers.dart' as app_serializer;
import 'package:mustang_core/mustang_core.dart';

import 'counter_service.service.dart';

@screenService
abstract class $CounterService {
  final String cacheKey = 'cache-example';

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
