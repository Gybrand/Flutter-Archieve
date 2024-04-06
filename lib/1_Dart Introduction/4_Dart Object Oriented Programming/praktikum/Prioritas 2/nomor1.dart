class Calculator {
  double add(double a, double b) {
    return a + b;
  }

  double subtract(double a, double b) {
    return a - b;
  }

  double multiply(double a, double b) {
    return a * b;
  }

  double divide(double a, double b) {
    if (b == 0) {
      throw ArgumentError("Cannot divide by zero");
    }
    return a / b;
  }
}

void main() {
  Calculator calculator = Calculator();

  double num1 = 10;
  double num2 = 5;

  print("$num1 + $num2 = ${calculator.add(num1, num2)}");
  print("$num1 - $num2 = ${calculator.subtract(num1, num2)}");
  print("$num1 * $num2 = ${calculator.multiply(num1, num2)}");

  double result;
  if (num2 != 0) {
    result = calculator.divide(num1, num2);
    print("$num1 / $num2 = $result");
  } else {
    print("Cannot divide by zero");
  }
}
