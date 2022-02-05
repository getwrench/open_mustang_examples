import 'dart:async';

import 'package:events/src/models/counter.model.dart';
import 'package:mustang_core/mustang_core.dart';

class IncrementService {
  static void start() {
    Timer.periodic(const Duration(seconds: 5), (_) {
      Counter counter = WrenchStore.get<Counter>() ?? Counter();
      counter = counter.rebuild((b) => b..value = (b.value ?? 0) + 1);
      EventStream.pushEvent(counter);
    });
  }
}
