import 'dart:developer';

double getAverage(List<num> numbers) {
  final result = numbers.fold(
        0.0,
        (previousValue, element) => previousValue + element,
      ) /
      numbers.length;
  log('Average of rating: $result');
  if (result.isNaN) {
    return 0.0;
  } else {
    return result;
  }
}
