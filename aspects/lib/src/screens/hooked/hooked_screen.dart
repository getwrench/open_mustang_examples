import 'package:flutter/material.dart';
import 'package:mustang_widgets/mustang_widgets.dart';

import 'hooked_service.service.dart';
import 'hooked_state.state.dart';

class HookedScreen extends StatelessWidget {
  const HookedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MustangScreen<HookedState>(
      state: HookedState(context: context),
      builder: (BuildContext context, HookedState state) {
        if (state.hooked.busy) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        return _body(state, context);
      },
    );
  }

  Widget _body(HookedState? state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aspects'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: HookedService().getData,
              child: const Text('Annotated method'),
            ),
            ElevatedButton(
              onPressed: HookedService().noAspectMethod,
              child: const Text('Normal method'),
            ),
          ],
        ),
      ),
    );
  }
}
