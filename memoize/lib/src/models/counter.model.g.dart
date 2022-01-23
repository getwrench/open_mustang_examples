// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counter.model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Counter> _$counterSerializer = new _$CounterSerializer();

class _$CounterSerializer implements StructuredSerializer<Counter> {
  @override
  final Iterable<Type> types = const [Counter, _$Counter];
  @override
  final String wireName = 'Counter';

  @override
  Iterable<Object?> serialize(Serializers serializers, Counter object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'value',
      serializers.serialize(object.value, specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  Counter deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CounterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'value':
          result.value = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Counter extends Counter {
  @override
  final bool busy;
  @override
  final int value;

  factory _$Counter([void Function(CounterBuilder)? updates]) =>
      (new CounterBuilder()..update(updates)).build();

  _$Counter._({required this.busy, required this.value}) : super._() {
    BuiltValueNullFieldError.checkNotNull(busy, 'Counter', 'busy');
    BuiltValueNullFieldError.checkNotNull(value, 'Counter', 'value');
  }

  @override
  Counter rebuild(void Function(CounterBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CounterBuilder toBuilder() => new CounterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Counter && busy == other.busy && value == other.value;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, busy.hashCode), value.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Counter')
          ..add('busy', busy)
          ..add('value', value))
        .toString();
  }
}

class CounterBuilder implements Builder<Counter, CounterBuilder> {
  _$Counter? _$v;

  bool? _busy;
  bool? get busy => _$this._busy;
  set busy(bool? busy) => _$this._busy = busy;

  int? _value;
  int? get value => _$this._value;
  set value(int? value) => _$this._value = value;

  CounterBuilder() {
    Counter._initializeBuilder(this);
  }

  CounterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _busy = $v.busy;
      _value = $v.value;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Counter other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Counter;
  }

  @override
  void update(void Function(CounterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Counter build() {
    final _$result = _$v ??
        new _$Counter._(
            busy:
                BuiltValueNullFieldError.checkNotNull(busy, 'Counter', 'busy'),
            value: BuiltValueNullFieldError.checkNotNull(
                value, 'Counter', 'value'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
