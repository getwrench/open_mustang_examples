import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $TokenValidation {
  @invoke
  void aroundValidation(Function sourceMethod) {
    print('after validation');
    sourceMethod();
  }
}
