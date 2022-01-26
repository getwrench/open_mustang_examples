import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $OnExceptionAspect {
  @invoke
  void run(Object e, StackTrace stackTrace) {
    print(e.toString());
  }
}