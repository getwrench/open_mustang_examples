import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $Temp {
  @invokeOnAsync
  Future<void> smartDesign(Function sourceMethod) async {
    print('temp -> before');
    await sourceMethod();
  }

  @invokeOnSync
  void doSomethingInTemp(Function sourceMethod) {

  }
}
