import 'package:mustang_core/mustang_core.dart';

@appModel
abstract class $Counter {
  @InitField(0)
  late int value;

  @InitField(false)
  late bool busy;
}
