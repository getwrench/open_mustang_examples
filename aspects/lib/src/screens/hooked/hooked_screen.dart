import 'package:flutter/material.dart';
import 'package:mustang_core/mustang_widgets.dart';
import 'package:flutter/scheduler.dart';

import 'hooked_service.service.dart';
import 'hooked_state.state.dart';

class HookedScreen extends StatelessWidget {
  const HookedScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateProvider<HookedState>(
      state: HookedState(),
      child: Builder(
        builder: (BuildContext context) {
          HookedState? state = StateConsumer<HookedState>().of(context);
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) => HookedService().memoizedGetData(),
          );

          if (state?.hooked.busy ?? false) {
            return const CircularProgressIndicator();
          }

          if (state?.hooked.errorMsg.isNotEmpty ?? false) {
            Text(state?.hooked.errorMsg ?? 'Unknown error');
          }

          return _body(state, context);
        },
      ),
    );
  }

  Widget _body(HookedState? state, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hooked'),
      ),
      body: RefreshIndicator(
        onRefresh: () => HookedService().getData(showBusy: false),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: HookedService().getData,
                child: const Text('call async getData'),
              ),
              ElevatedButton(
                onPressed: HookedService().sampleMethod,
                child: const Text('call sync method'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
