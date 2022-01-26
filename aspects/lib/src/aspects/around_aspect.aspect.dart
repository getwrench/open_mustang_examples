// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppAspectGenerator
// **************************************************************************

import 'package:mustang_core/mustang_core.dart';
import 'package:aspects/src/aspects/around_aspect.dart';

import 'dart:core';

class $$AroundAspect extends $AroundAspect {
  Future<void> invoke(Function sourceMethod) async {
    await super.run(
      sourceMethod,
    );
  }
}

class AroundAspect implements AspectBuilder {
  const AroundAspect();
}

const aroundAspect = AroundAspect();
