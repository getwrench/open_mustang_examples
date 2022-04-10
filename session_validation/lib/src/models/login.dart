import 'package:mustang_core/mustang_core.dart';

@appModel
abstract class $Login {
  @InitField(false)
  @SerializeField(false)
  late bool busy;

  @InitField('')
  @SerializeField(false)
  late String errorMsg;

  @InitField(false)
  late bool clearScreenCache;

  @InitField(false)
  late bool loggedIn;
}
