String customIdGenerate({
  String prefix = '',
  String separator = '',
  int len = 8,
}) {
  final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];
  list.shuffle();
  final id = '$prefix$separator${list.join()}';

  return id;
}
