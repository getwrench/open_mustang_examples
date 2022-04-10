import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';

import 'home_service.service.dart';
import 'home_state.state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<HomeState>(
      state: HomeState(context: context),
      child: Builder(
        builder: (BuildContext context) {
          HomeState? state = StateConsumer<HomeState>().of(context);
          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(HomeState? state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: RouteRedirect(
        test: () => !state!.login.loggedIn,
        targetRouteName: '/login',
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  await HomeService().logout();
                  if (state!.login.loggedIn) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to logout'),
                      ),
                    );
                  }
                },
                child: const Text('Logout..'),
              ),
              ElevatedButton(
                onPressed: () => HomeService().updateState(),
                child: const Text('Reload'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
