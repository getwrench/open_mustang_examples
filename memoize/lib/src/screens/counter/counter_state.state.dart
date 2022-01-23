// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// ScreenStateGenerator
// **************************************************************************

import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:memoize/src/models/counter.model.dart';
import 'dart:core';

class CounterState extends ChangeNotifier {
  CounterState() {
    mounted = true;
    WrenchStore.update(this);
    if (kDebugMode) {
      postEvent('mustang', {
        'modelName': '$CounterState',
        'modelStr': jsonEncode(toJson()),
      });
    }
  }

  bool mounted = false;

  Map<String, dynamic> toJson() {
    return {'mounted': mounted};
  }

  Counter get counter => WrenchStore.get<Counter>() ?? Counter();

  void update() {
    if (mounted) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    mounted = false;
    if (kDebugMode) {
      postEvent('mustang', {
        'modelName': '$CounterState',
        'modelStr': '{}',
      });
    }
    super.dispose();
  }
}
