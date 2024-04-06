void main() {
  List<List<int>> dataList = [
    [1, 10],
    [2, 20],
    [3, 30],
    [4, 40],
    [5, 50]
  ];

  Map<int, List<int>> dataMap = {};

  for (var element in dataList) {
    if (element.length == 2) {
      int key = element[0];
      List<int> value = [element[1]];
      dataMap[key] = value;
    }
  }

  print(dataMap);
}
