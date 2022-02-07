import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $BeforeAspect {
  @invoke
  Future<void> run() async {
    print('BeforeAspect -> run');
  }
}
