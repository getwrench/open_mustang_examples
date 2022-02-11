import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $AroundAspect {
  @invoke
  Future<void> run(Map<String, dynamic> args, Function sourceMethod) async {
    print('AroundAspect -> before');
    await sourceMethod();
    print('AroundAspect -> after');
  }
}
