import 'package:flutter/material.dart';
import 'package:mustang_widgets/mustang_widgets.dart';

import 'login_service.service.dart';
import 'login_state.state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MustangScreen<LoginState>(
      state: LoginState(context: context),
      builder: (BuildContext context, LoginState state) {
        return RouteRedirect(
          test: () => state.login.loggedIn,
          targetRouteName: '/home',
          child: _body(state, context),
        );
      },
    );
  }

  Widget _body(LoginState? state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await LoginService().login();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
