// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppAspectGenerator
// **************************************************************************

import 'package:mustang_core/mustang_core.dart';
import 'package:aspects/src/aspects/on_exception_aspect.dart';

import 'dart:core';

class $$OnExceptionAspect extends $OnExceptionAspect {
  void invoke(Object e, StackTrace stackTrace) {
    super.run(
      e,
      stackTrace,
    );
  }
}

class OnExceptionAspect implements AspectBuilder {
  const OnExceptionAspect();
}

const onExceptionAspect = OnExceptionAspect();
