import 'package:flutter_riverpod/flutter_riverpod.dart';

// cash에 저장하지 않고 위젯이 생성 될 때 항상 새로 시작 됨
// 자동 제거 된다.
final autoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return [1, 2, 3, 4, 5];
});
