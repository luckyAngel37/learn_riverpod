import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final testProvider = StateProvider((_) => 0);

class RiverpodWithHook extends HookWidget {
  const RiverpodWithHook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('RiverpodWithHook/build');
    final testState = useProvider(testProvider);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 32.0),
              Text('test = ${testState.state}'),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  context.read(testProvider).state++;
                },
                child: Text('test RiverpodWithHook'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
