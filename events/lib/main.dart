import 'package:events/src/screens/counter/counter_screen.dart';
import 'package:events/src/screens/counter2/counter2_screen.dart';
import 'package:events/src/shared_services/increment_service.dart';
import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

void main() {
  IncrementService.start();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        '/counter1': (BuildContext _) => const CounterScreen(),
        '/counter2': (BuildContext _) => const Counter2Screen(),
      },
      home: const CounterScreen(),
      navigatorObservers: [
        MustangRouteObserver.getInstance(),
      ],
    );
  }
}
