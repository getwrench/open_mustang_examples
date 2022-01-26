import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:persistence/src/utils/routes.dart';

class Connectivity {
  main() async {
    bool preValue = true;
    Timer.periodic(const Duration(seconds: 2), (timer) async {
      bool value = await compute(_check, null);
      if (preValue != value) {
        if (navigationKey.currentContext != null) {
          ScaffoldMessenger.of(
            navigationKey.currentContext!,
          ).showSnackBar(
            SnackBar(
              content: Text(
                value ? 'Connected' : 'No Connected',
              ),
              action: SnackBarAction(
                label: 'Dismiss',
                onPressed: ScaffoldMessenger.of(
                  navigationKey.currentContext!,
                ).hideCurrentSnackBar,
              ),
            ),
          );
        }
        preValue = value;
      }
    });
  }

  Future<bool> _check(_) async {
    try {
      final result = await InternetAddress.lookup('wrench.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
