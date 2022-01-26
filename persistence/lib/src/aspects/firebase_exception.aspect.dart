// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppAspectGenerator
// **************************************************************************

import 'package:mustang_core/mustang_core.dart';
import 'package:persistence/src/aspects/firebase_exception.dart';

class $$FirebaseException extends $FirebaseException {
  void invokeOnSync(Function sourceMethod) {
    super.doSomeWord(sourceMethod);
  }

  Future<void> invokeOnAsync(Function sourceMethod) async {
    await super.aroundHook(sourceMethod);
  }
}

class FirebaseException {
  const FirebaseException();
}

const firebaseException = FirebaseException();
