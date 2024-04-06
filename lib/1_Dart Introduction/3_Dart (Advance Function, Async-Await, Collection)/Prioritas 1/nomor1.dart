Future<List<int>> multiplyListElements(List<int> data, int multiplier) async {
  List<int> result = [];
  for (var element in data) {
    int multipliedElement = await multiplyElementAsync(element, multiplier);
    result.add(multipliedElement);
  }
  return result;
}

Future<int> multiplyElementAsync(int element, int multiplier) async {
  await Future.delayed(Duration(seconds: 1));
  return element * multiplier;
}

Future<void> main() async {
  List<int> data = [1, 2, 3, 4, 5];
  int multiplier = 3;

  List<int> multipliedResult = await multiplyListElements(data, multiplier);

  print(multipliedResult);
}
