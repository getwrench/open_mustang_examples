import 'package:events/src/models/counter.model.dart';
import 'package:events/src/screens/counter/counter_service.service.dart';
import 'package:mustang_core/mustang_core.dart';

import 'counter_state.dart';

@ScreenService(screenState: $CounterState)
abstract class $CounterService {
  Future<void> getData() async {
    Counter counter = WrenchStore.get<Counter>() ?? Counter();
    // Add API calls here, if any
    counter = counter.rebuild((b) => b..busy = false);
    updateState1(counter);
  }
}
