import 'package:mustang_core/mustang_core.dart';

@appModel
class $Counter {
  @InitField(false)
  @SerializeField(false)
  bool? busy;

  @InitField('')
  @SerializeField(false)
  String? errorMsg;

  @InitField(false)
  bool? clearScreenCache;

  @InitField(0)
  int? value;
}
