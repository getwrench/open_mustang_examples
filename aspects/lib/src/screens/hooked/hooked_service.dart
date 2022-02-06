import 'package:aspects/src/aspects/after_aspect.aspect.dart';
import 'package:aspects/src/aspects/around_aspect.aspect.dart';
import 'package:aspects/src/aspects/firebase_aspect.aspect.dart';
import 'package:aspects/src/models/hooked.model.dart';
import 'package:mustang_core/mustang_core.dart';

import 'hooked_service.service.dart';
import 'hooked_state.dart';

@ScreenService(screenState: $HookedState)
abstract class $HookedService {
  Future<void> memoizedGetData() {
    Hooked hooked = WrenchStore.get<Hooked>() ?? Hooked();
    if (hooked.clearScreenCache) {
      clearMemoizedScreen(reload: false);
      hooked = hooked.rebuild(
        (b) => b..clearScreenCache = false,
      );
      updateState1(hooked, reload: false);
    }
    return memoizeScreen(getData);
  }

  @Before([firebaseAspect])
  @Around(aroundAspect)
  @After([afterAspect])
  Future<void> getData({
    bool showBusy = true,
  }) async {
    Hooked hooked = WrenchStore.get<Hooked>() ?? Hooked();
    if (showBusy) {
      hooked = hooked.rebuild(
        (b) => b
          ..busy = true
          ..errorMsg = '',
      );
      updateState1(hooked);
    }

    print('getData - before');
    await Future.delayed(const Duration(seconds: 5));
    print('getData - after');
    // Add API calls here, if any
    hooked = hooked.rebuild((b) => b..busy = false);
    updateState1(hooked);
  }

  void sampleMethod() {
    print('normal method');
  }

  void clearCacheAndReload({bool reload = true}) {
    clearMemoizedScreen(reload: reload);
  }
}
