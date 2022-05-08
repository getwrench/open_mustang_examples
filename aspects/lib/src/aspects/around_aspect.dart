import 'package:flutter/foundation.dart';
import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $AroundAspect {
  @invoke
  Future<void> run(Map<String, dynamic> args, Function sourceMethod) async {
    if (kDebugMode) {
      print('Around aspect : Started');
    }
    await sourceMethod();
    if (kDebugMode) {
      print('Around aspect : Completed');
    }
  }
}
