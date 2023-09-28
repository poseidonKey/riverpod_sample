import 'package:flutter_riverpod/flutter_riverpod.dart';

final multiplesFutureProvider = FutureProvider<List<int>>((ref) async {
  // final result = await MultiplesRepository.getMultiplesFuture(number: 2);

  // return result;
  await Future.delayed(
    const Duration(seconds: 3),
  );
  // throw Exception('Error 입니다.');
  return [1, 2, 3, 4, 5];
});
