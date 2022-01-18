import 'package:mustang_core/mustang_core.dart';

@hook
abstract class $FirebaseException extends Aspect {
  @override
  void onException(Object e, StackTrace stackTrace) {
    // TODO: implement onException
  }

  @override
  void postHook() {
    // TODO: implement postHook
  }

  @override
  bool preHook() {
    // TODO: implement preHook
    throw UnimplementedError();
  }

}