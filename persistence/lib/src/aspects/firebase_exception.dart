import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $FirebaseException {
  @invoke
  Future<void> aroundHook(Function sourceMethod) async {
    print('before');
    await sourceMethod();
    print('after');
  }
}
