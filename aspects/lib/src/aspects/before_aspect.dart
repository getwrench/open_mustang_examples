import 'package:flutter/foundation.dart';
import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $BeforeAspect {
  @invoke
  Future<void> run(Map<String, dynamic> args) async {
    if (kDebugMode) {
      print('Before aspect : Run');
    }
  }
}
