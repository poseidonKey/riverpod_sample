import 'package:f_riverpod/layout/default_layout.dart';
import 'package:f_riverpod/riverpod/code_generation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    return DefaultLayout(
      title: 'CodeGeneration',
      body: Column(
        children: [
          Text('state 1 : $state1'),
        ],
      ),
    );
  }
}
