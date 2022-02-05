// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ScreenServiceGenerator
// **************************************************************************

import 'package:mustang_core/mustang_core.dart';
import 'counter_service.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:events/src/models/serializers.dart' as app_serializer;

import 'package:events/src/models/counter.model.dart';

import 'counter_state.state.dart';

class _$CounterStateCache<T> {
  const _$CounterStateCache([this.t]);

  Map<String, dynamic> toJson() {
    return {
      '$T': '$t',
    };
  }

  final T? t;
}

class CounterService extends $CounterService {
  static String _serviceName = '';

  CounterService() {
    if (_serviceName != 'CounterService') {
      _serviceName = 'CounterService';
      subscribeToEvent();
    }
  }

  Future<void> subscribeToEvent() async {
    EventStream.reset();
    await for (AppEvent event in EventStream.getStream()) {
      if (event is Counter) {
        Counter m = event;
        updateState1(m);
      }
    }
  }
}

extension $$CounterService on $CounterService {
  void updateState() {
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      screenState.update();
    }
  }

  void updateState1<T>(
    T t, {
    reload = true,
  }) {
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      WrenchStore.update(t);
      WrenchStore.persistObject(
        '$T',
        jsonEncode(app_serializer.serializers.serialize(t)),
      );
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '$T',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(t)),
        });
      }
      if (reload) {
        screenState.update();
      }
    }
  }

  void updateState2<T, S>(
    T t,
    S s, {
    reload = true,
  }) {
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      WrenchStore.update2(t, s);
      WrenchStore.persistObject(
        '$T',
        jsonEncode(app_serializer.serializers.serialize(t)),
      );
      WrenchStore.persistObject(
        '$S',
        jsonEncode(app_serializer.serializers.serialize(s)),
      );
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '$T',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(t)),
        });
        postEvent('mustang', {
          'modelName': '$S',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(s)),
        });
      }
      if (reload) {
        screenState.update();
      }
    }
  }

  void updateState3<T, S, U>(
    T t,
    S s,
    U u, {
    reload = true,
  }) {
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      WrenchStore.update3(t, s, u);
      WrenchStore.persistObject(
        '$T',
        jsonEncode(app_serializer.serializers.serialize(t)),
      );
      WrenchStore.persistObject(
        '$S',
        jsonEncode(app_serializer.serializers.serialize(s)),
      );
      WrenchStore.persistObject(
        '$U',
        jsonEncode(app_serializer.serializers.serialize(u)),
      );
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '$T',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(t)),
        });
        postEvent('mustang', {
          'modelName': '$S',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(s)),
        });
        postEvent('mustang', {
          'modelName': '$U',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(u)),
        });
      }
      if (reload) {
        screenState.update();
      }
    }
  }

  void updateState4<T, S, U, V>(
    T t,
    S s,
    U u,
    V v, {
    reload = true,
  }) {
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      WrenchStore.update4(t, s, u, v);
      WrenchStore.persistObject(
        '$T',
        jsonEncode(app_serializer.serializers.serialize(t)),
      );
      WrenchStore.persistObject(
        '$S',
        jsonEncode(app_serializer.serializers.serialize(s)),
      );
      WrenchStore.persistObject(
        '$U',
        jsonEncode(app_serializer.serializers.serialize(u)),
      );
      WrenchStore.persistObject(
        '$V',
        jsonEncode(app_serializer.serializers.serialize(v)),
      );
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '$T',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(t)),
        });
        postEvent('mustang', {
          'modelName': '$S',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(s)),
        });
        postEvent('mustang', {
          'modelName': '$U',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(u)),
        });
        postEvent('mustang', {
          'modelName': '$V',
          'modelStr': jsonEncode(app_serializer.serializers.serialize(v)),
        });
      }
      if (reload) {
        screenState.update();
      }
    }
  }

  T memoizeScreen<T>(T Function() service) {
    _$CounterStateCache screenStateCache =
        WrenchStore.get<_$CounterStateCache>() ?? const _$CounterStateCache();
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();

    if (screenStateCache.t == null) {
      T t = service();
      screenStateCache = _$CounterStateCache(t);
      WrenchStore.update(screenStateCache);
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '${_$CounterStateCache}',
          'modelStr': jsonEncode(screenStateCache.toJson()),
        });
      }
      if (t is Future) {
        t.whenComplete(() {
          if (!(screenState.mounted)) {
            WrenchStore.delete<_$CounterStateCache>();
            if (kDebugMode) {
              postEvent('mustang', {
                'modelName': '${_$CounterStateCache}',
                'modelStr': '{}',
              });
            }
          }
        });
      }
    }
    return screenStateCache.t;
  }

  void clearMemoizedScreen({
    reload = true,
  }) {
    WrenchStore.delete<_$CounterStateCache>();
    if (kDebugMode) {
      postEvent('mustang', {
        'modelName': '${_$CounterStateCache}',
        'modelStr': '{}',
      });
    }
    CounterState screenState =
        WrenchStore.get<CounterState>() ?? CounterState();
    if (screenState.mounted) {
      if (reload) {
        screenState.update();
      }
    }
  }

  Future<void> addObjectToCache<T>(String key, T t) async {
    await WrenchCache.addObject(
      key,
      '$T',
      jsonEncode(app_serializer.serializers.serialize(t)),
    );
  }

  Future<void> deleteObjectsFromCache(String key) async {
    await WrenchCache.deleteObjects(key);
  }

  bool itemExistsInCache(String key) {
    return WrenchCache.itemExists(key);
  }
}
