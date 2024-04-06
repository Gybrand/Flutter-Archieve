import 'dart:async';

Future<int> factorialAsync(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    int result = 1;
    for (int i = 2; i <= n; i++) {
      result *= i;
    }
    return result;
  }
}

Future<void> main() async {
  int input = 5;

  int result = await factorialAsync(input);

  print(result);
}
