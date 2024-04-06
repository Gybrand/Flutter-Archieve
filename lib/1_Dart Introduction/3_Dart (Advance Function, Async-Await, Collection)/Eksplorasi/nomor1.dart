List<String> removeDuplicates(List<String> inputList) {
  Set<String> uniqueSet = Set<String>.from(inputList);
  List<String> uniqueList = List<String>.from(uniqueSet);
  return uniqueList;
}

void main() {
  List<String> input = [
    "amuse",
    "tommy kaira",
    "spoon",
    "HKS",
    "litchfield",
    "amuse",
    "HKS"
  ];

  /* List<String> input = [
  "JS Racing",
  "amuse",
  "spoon",
  "spoon",
  "JS Racing",
  "amuse"
];
 */

  List<String> output = removeDuplicates(input);

  print(output);
}
