import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final testProvider = StateProvider((_) => 0);

class RiverpodNoHook extends StatelessWidget {
  const RiverpodNoHook({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    debugPrint('RiverpodNoHook/build');
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 32.0),
              Consumer(
                builder: (context, watch, child) {
                  debugPrint('RiverpodNoHook/Consumer/build');
                  final state = watch(testProvider).state;
                  return Text('test = $state');
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  context.read(testProvider).state++;
                },
                child: Text('Test RiverpodNoHook'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
