import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'login_service.service.dart';
import 'login_state.state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<LoginState>(
      state: LoginState(context: context),
      child: Builder(
        builder: (BuildContext context) {
          LoginState? state = StateConsumer<LoginState>().of(context);
          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(LoginState? state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: RouteRedirect(
        test: () => state!.login.loggedIn,
        targetRouteName: '/home',
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              await LoginService().login();
            },
            child: const Text('Login'),
          ),
        ),
      ),
    );
  }
}
