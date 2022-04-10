import 'package:mustang_core/mustang_core.dart';
import 'package:session_validation/src/models/login.model.dart';

import 'home_service.service.dart';

@screenService
abstract class $HomeService {
  Future<void> logout() async {
    Login login = MustangStore.get<Login>() ?? Login();
    login = login.rebuild((b) => b..loggedIn = false);
    updateState1(login);
  }
}
