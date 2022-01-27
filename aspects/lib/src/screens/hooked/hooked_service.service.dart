// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ScreenServiceGenerator
// **************************************************************************

import 'package:mustang_core/mustang_core.dart';
import 'hooked_service.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:aspects/src/models/serializers.dart' as app_serializer;

import 'dart:core';
import 'package:aspects/src/aspects/firebase_aspect.aspect.dart';
import 'package:aspects/src/aspects/after_aspect.aspect.dart';
import 'package:aspects/src/aspects/around_aspect.aspect.dart';
import 'package:aspects/src/aspects/on_exception_aspect.aspect.dart';
import 'hooked_state.state.dart';

class _$HookedStateCache<T> {
  const _$HookedStateCache([this.t]);

  Map<String, dynamic> toJson() {
    return {
      '$T': '$t',
    };
  }

  final T? t;
}

class HookedService extends $HookedService {
  @override
  Future<void> getData({bool showBusy = true}) async {
    try {
      $$FirebaseAspect().invoke();

      await $$AroundAspect().invoke(() async {
        await super.getData(
          showBusy: showBusy,
        );
      });
      $$AfterAspect().invoke();
    } catch (e, stackTrace) {
      $$OnExceptionAspect().invoke(e, stackTrace);
    }
  }

  @override
  void sampleMethod() {
    try {
      $$FirebaseAspect().invoke();

      super.sampleMethod();
      $$AfterAspect().invoke();
    } catch (e, stackTrace) {
      $$OnExceptionAspect().invoke(e, stackTrace);
    }
  }
}

extension $$HookedService on $HookedService {
  void updateState() {
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
    if (screenState.mounted) {
      screenState.update();
    }
  }

  void updateState1<T>(
    T t, {
    reload = true,
  }) {
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
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
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
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
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
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
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
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
    _$HookedStateCache screenStateCache =
        WrenchStore.get<_$HookedStateCache>() ?? const _$HookedStateCache();
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();

    if (screenStateCache.t == null) {
      T t = service();
      screenStateCache = _$HookedStateCache(t);
      WrenchStore.update(screenStateCache);
      if (kDebugMode) {
        postEvent('mustang', {
          'modelName': '${_$HookedStateCache}',
          'modelStr': jsonEncode(screenStateCache.toJson()),
        });
      }
      if (t is Future) {
        t.whenComplete(() {
          if (!(screenState.mounted)) {
            WrenchStore.delete<_$HookedStateCache>();
            if (kDebugMode) {
              postEvent('mustang', {
                'modelName': '${_$HookedStateCache}',
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
    WrenchStore.delete<_$HookedStateCache>();
    if (kDebugMode) {
      postEvent('mustang', {
        'modelName': '${_$HookedStateCache}',
        'modelStr': '{}',
      });
    }
    HookedState screenState = WrenchStore.get<HookedState>() ?? HookedState();
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
