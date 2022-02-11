import 'package:aspects/src/aspects/after_aspect.aspect.dart';
import 'package:aspects/src/aspects/around_aspect.aspect.dart';
import 'package:aspects/src/aspects/before_aspect.aspect.dart';
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

  @Before([beforeAspect], args: {'aa': 2, 'bb': 22.2})
  @After([afterAspect], args: {})
  @Around(aroundAspect, args: {'aas': null})
  Future<void> getData({
    bool showBusy = true,
  }) async {
    print('source method - start');
    Hooked hooked = WrenchStore.get<Hooked>() ?? Hooked();
    if (showBusy) {
      hooked = hooked.rebuild(
        (b) => b
          ..busy = true
          ..errorMsg = '',
      );
      updateState1(hooked);
    }
    await Future.delayed(const Duration(seconds: 5));

    // Add API calls here, if any
    hooked = hooked.rebuild((b) => b..busy = false);
    updateState1(hooked);

    print('source method - end');
  }

  void sampleMethod() {
    print('normal method');
  }

  void clearCacheAndReload({bool reload = true}) {
    clearMemoizedScreen(reload: reload);
  }
}
