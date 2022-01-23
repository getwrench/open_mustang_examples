import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $TokenValidation {
  @invokeOnSync
  void aroundValidation(Function sourceMethod) {
    print('after validation');
    sourceMethod();
  }
}
