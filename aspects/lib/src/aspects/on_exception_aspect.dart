import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $OnExceptionAspect {
  @invoke
  void run(Function e) {
    print(e.toString());
  }
}