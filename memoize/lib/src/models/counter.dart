import 'package:mustang_core/mustang_core.dart';

@appModel
abstract class $Counter {
  @InitField(false)
  @SerializeField(false)
  late bool busy;

  @InitField(0)
  late int value;
}
