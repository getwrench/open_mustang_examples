import 'package:mustang_core/mustang_core.dart';
import 'package:session_validation/src/models/login.model.dart';

import 'login_service.service.dart';

@screenService
abstract class $LoginService {
  Future<void> login() async {
    Login login = MustangStore.get<Login>() ?? Login();
    login = login.rebuild((b) => b..loggedIn = true);
    updateState1(login);
  }
}
