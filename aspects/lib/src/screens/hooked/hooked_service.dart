import 'package:aspects/src/aspects/after_aspect.aspect.dart';
import 'package:aspects/src/aspects/around_aspect.aspect.dart';
import 'package:aspects/src/aspects/before_aspect.aspect.dart';
import 'package:aspects/src/models/hooked.model.dart';
import 'package:flutter/foundation.dart';
import 'package:mustang_core/mustang_core.dart';

import 'hooked_service.service.dart';

@screenService
abstract class $HookedService {

  @Before([beforeAspect], args: {'one': 1, 'two': 2.2})
  @After([afterAspect], args: {})
  @Around(aroundAspect, args: {'three': null})
  Future<void> getData({
    bool showBusy = true,
  }) async {
    if (kDebugMode) {
      print('Annotated method : Start');
    }
    Hooked hooked = MustangStore.get<Hooked>() ?? Hooked();
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

    if (kDebugMode) {
      print('Annotated method : End');
    }
  }

  void noAspectMethod() {
    if (kDebugMode) {
      print('Normal method');
    }
  }
}
