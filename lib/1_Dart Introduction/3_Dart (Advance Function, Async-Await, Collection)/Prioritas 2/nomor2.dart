void main() {
  List<int> values = [7, 5, 3, 5, 2, 1];

  int sum = values.reduce((value, element) => value + element);
  double average = sum / values.length;

  int roundedAverage = average.ceil();

  print(roundedAverage); // Output: 4
}
