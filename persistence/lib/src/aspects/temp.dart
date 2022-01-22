import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $Temp {
  @invoke
  Future<void> smartDesign(Function sourceMethod) async {
    print('after validation');
    await sourceMethod();
  }
}
