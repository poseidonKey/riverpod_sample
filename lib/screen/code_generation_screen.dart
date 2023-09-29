import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/code_generation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(
      gStateMultiplyProvider(num1: 10, num2: 20),
    );
    final state5 = ref.watch(gStateNotifierProvider);
    return DefaultLayout(
      title: 'CodeGeneration',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('state 1 : $state1'),
          Text('state 2 : $state2'),
          state2.when(
            data: (data) {
              return Text('value state2 :  $data');
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
          state3.when(
            data: (data) {
              return Text('value state3 :  $data');
            },
            error: (err, stack) => Text(
              err.toString(),
            ),
            loading: () => const CircularProgressIndicator(),
          ),
          Text('family  data : $state4'),
          Text('state notifier data : $state5'),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('increment'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('decrement'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // 현재 프로바이더를 최초 상태... 실습에서는 0으로 초기화 시킨다.
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text('invalidate'),
          ),
          // 모두 빌드 되지 않고 아래 위젯 하나만 빌드 됨.
          const _StateFiveWidget(),
          // 모두 빌드 되지 않고 원하는 위젯만 빌드 시킨다.
          Consumer(
            builder: (context, ref, child) {
              final state5Consumer = ref.watch(gStateNotifierProvider);
              print('builder build');
              return Row(
                children: [
                  Text('state5 의 consumer value : $state5Consumer'),
                  const SizedBox(
                    width: 20,
                  ),
                  if (child != null) child
                ],
              );
            },
            // 아래의 child는 리 빌드 시키지 않는다.
            // 제외시키는 형태
            child: const Text('    hello'),
          ),
        ],
      ),
    );
  }
}

class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5_1 = ref.watch(gStateNotifierProvider);
    return Column(
      children: [
        Text('State5_1 value : $state5_1'),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).increment();
              },
              child: const Text('increment'),
            ),
            const SizedBox(
              width: 20,
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(gStateNotifierProvider.notifier).decrement();
              },
              child: const Text('decrement'),
            ),
          ],
        ),
      ],
    );
  }
}
