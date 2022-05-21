import 'package:events/src/models/counter.dart';
import 'package:events/src/models/counter2.dart';
import 'package:events/src/models/timer_event.dart';
import 'package:mustang_core/mustang_core.dart';

@screenState
abstract class $CounterState {
  late $Counter counter;

  late $Counter2 counter2;

  late $TimerEvent timerEvent;
}
