
import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $FirebaseAspect {
  @invoke
  void run() {
    print('FirebaseAspect -> run');
  }
}