import 'dart:async';

import 'package:events/src/models/timer_event.model.dart';
import 'package:mustang_core/mustang_core.dart';

class IncrementService {
  static void start() {
    Timer.periodic(const Duration(seconds: 5), (_) {
      TimerEvent timerEvent = MustangStore.get<TimerEvent>() ?? TimerEvent();
      timerEvent = timerEvent.rebuild((b) => b..value = (b.value ?? 0) + 1);
      EventStream.pushEvent(timerEvent);
    });
  }
}
