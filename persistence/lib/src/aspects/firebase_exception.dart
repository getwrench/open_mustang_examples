import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $FirebaseException {
  @invokeOnAsync
  Future<void> aroundHook(Function sourceMethod) async {
    print('firebase -> before');
    await sourceMethod();
    print('firebase -> after');
  }

  @invokeOnSync
  void doSomeWord(Function sourceMethod) {

  }
}
