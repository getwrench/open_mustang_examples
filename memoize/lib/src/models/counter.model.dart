// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppModelGenerator
// **************************************************************************

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'dart:core';

part 'counter.model.g.dart';

abstract class Counter implements Built<Counter, CounterBuilder> {
  Counter._();
  factory Counter([void Function(CounterBuilder) updates]) = _$Counter;

  @BuiltValueField(serialize: false)
  bool get busy;

  int get value;

  static Serializer<Counter> get serializer => _$counterSerializer;

  static void _initializeBuilder(CounterBuilder builder) => builder
    ..busy = false
    ..value = 0;
}
