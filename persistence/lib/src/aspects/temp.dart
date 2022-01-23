import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $Temp {
  @invokeOnAsync
  Future<void> smartDesign(Function sourceMethod) async {
    print('temp -> before');
    await sourceMethod();
    print('temp -> after');
  }

  @invokeOnSync
  void doSomethingInTemp(Function sourceMethod) {

  }
}
