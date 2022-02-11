import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $AfterAspect {
  @invoke
  Future<void> run(Map<String, dynamic> args) async {
    print('AfterAspect -> run');
  }
}
