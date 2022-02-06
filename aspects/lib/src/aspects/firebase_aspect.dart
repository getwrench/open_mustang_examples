
import 'package:mustang_core/mustang_core.dart';

@aspect
abstract class $FirebaseAspect {
  @invoke
  Future<void> run() async {
    print('FirebaseAspect -> run');
  }
}