import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_tutorial/layout/default_layout.dart';
import 'package:flutter_state_tutorial/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(gStateMultiplyProvider(number1: 2, number2: 5));

    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('state1: $state1'),
          state2.when(
            data: (data) {
              return Text(
                'state2: $data',
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) {
              return Text(
                'state2: $data',
              );
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
          Text('state4: $state4'),
          Consumer(builder: (context, ref, child) {
            final state5 = ref.watch(gStateNotifierProvider);

            return Text('state5: $state5');
          }),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).increment();
                  },
                  child: const Text('증가')),
              ElevatedButton(
                  onPressed: () {
                    ref.read(gStateNotifierProvider.notifier).decrement();
                  },
                  child: const Text('감소')),
            ],
          ),
          // invalidated
          ElevatedButton(
              onPressed: () {
                ref.invalidate(gStateNotifierProvider);
              },
              child: const Text('Invalidate'))
        ],
      ),
    );
  }
}
