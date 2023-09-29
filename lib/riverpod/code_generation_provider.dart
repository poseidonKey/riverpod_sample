/*
  1. 어떤 Provider를 사용할 지 결정할 고민 없도록
  Provider, FutureProvider, StreamProvider(X)
  StateNotifierProvider
*/

import 'dart:ffi';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'code_generation_provider.g.dart';

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');
@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  return 10;
}

@Riverpod(
    //dispose 하지 말고 캐시에 남겨 둬라. false
    keepAlive: true)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(
    const Duration(seconds: 3),
  );
  return 10;
}

/*
  2. Parameter > Family 파라미터를 일반 함수 처럼 사용할 수 있도록 
*/
class Parameter {
  final int num1;
  final int num2;

  Parameter({required this.num1, required this.num2});
}

final _testFamilyProvider = Provider.family<int, Parameter>(
  (ref, parameter) => parameter.num1 * parameter.num2,
);
// 위의 내용을 아래와 같이 간단하게 처리 할 수 있다.
@riverpod
int gStateMultiply(GStateMultiplyRef ref,
    {required int num1, required int num2}) {
  return num1 * num2;
}

@riverpod
class GStateNotifier extends _$GStateNotifier {
  @override
  int build() {
    return 0;
  }

  increment() {
    state++;
  }

  decrement() {
    state--;
  }
}
