import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $AfterAspect {
  @invoke
  void run() {
    print('AfterAspect -> run');
  }
}