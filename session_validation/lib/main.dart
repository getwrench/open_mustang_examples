import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_core.dart';
import 'package:path_provider/path_provider.dart';
import 'package:session_validation/src/models/serializers.dart'
    as app_serializer;
import 'package:session_validation/src/screens/home/home_screen.dart';
import 'package:session_validation/src/screens/login/login_screen.dart';

Future<void> main() async {
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
      home: const LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext _) => const LoginScreen(),
        '/home': (BuildContext _) => const HomeScreen(),
      },
    );
  }
}
