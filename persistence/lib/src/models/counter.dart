import 'package:mustang_core/mustang_core.dart';

@appModel
class $Counter {
  @InitField(false)
  @SerializeField(false)
  late bool busy;

  @InitField('')
  @SerializeField(false)
  late String errorMsg;

  @InitField(false)
  late bool clearScreenCache;

  @InitField(0)
  late int value;

  @InitField(0)
  @SerializeField(false)
  late int tempValue;
}