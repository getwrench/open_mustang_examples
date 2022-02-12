import 'package:events/src/models/counter2.model.dart';
import 'package:mustang_core/mustang_core.dart';

import 'counter2_service.service.dart';
import 'counter2_state.dart';

@ScreenService(screenState: $Counter2State)
abstract class $Counter2Service {
  Future<void> getData() async {
    Counter2 counter2 = MustangStore.get<Counter2>() ?? Counter2();
    // Add API calls here, if any
    counter2 = counter2.rebuild((b) => b..busy = false);
    updateState1(counter2);
  }
}
