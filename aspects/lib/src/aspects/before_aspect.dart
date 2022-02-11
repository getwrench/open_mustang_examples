import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $BeforeAspect {
  @invoke
  Future<void> run(Map<String, dynamic> args) async {
    print('BeforeAspect -> run');
  }
}
