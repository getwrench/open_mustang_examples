import 'dart:io';

import 'package:aspects/src/screens/hooked/hooked_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:aspects/src/models/serializers.dart' as app_serializer;
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure persistence support for the app
  MustangStore.config(
    isPersistent: true,
    storeName: 'mustang-persistence',
  );

  Directory? dir;
  if (!kIsWeb) {
    dir = await getApplicationDocumentsDirectory();
  }
  await MustangStore.initPersistence(dir?.path);

  // Restore persisted state before the app starts
  await MustangStore.restoreState(
    app_serializer.json2Type,
    app_serializer.serializerNames,
  );
  // Start the app
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
      home: const HookedScreen(),
    );
  }
}

