/*
  1. 어떤 Provider를 사용할 지 결정할 고민 없도록
  Provider, FutureProvider, StreamProvider(X)
  StateNotifierProvider
*/

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'code_generation_provider.g.dart';

final _testProvider = Provider<String>((ref) => 'Hello Code Generation');
@riverpod
String gState(GStateRef ref) {
  return 'Hello Code Generation';
}

/*
  2. Parameter > Family 파라미터를 일반 함수 처럼 사용할 수 있도록 
*/
