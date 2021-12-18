import 'dart:io';

import 'package:cache/src/models/serializers.dart' as app_serializer;
import 'package:cache/src/screens/counter/counter_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure persistence support for the app
  // Caching needs persistence to be enabled.
  WrenchStore.config(
    isPersistent: true,
    storeName: 'mustang-cache1',
  );

  Directory? dir;
  if (!kIsWeb) {
    dir = await getApplicationDocumentsDirectory();
  }
  await WrenchStore.initPersistence(dir?.path);

  // Restore persisted state before the app starts
  await WrenchStore.restoreState(
    app_serializer.json2Type,
    app_serializer.serializerNames,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterScreen(),
    );
  }
}
