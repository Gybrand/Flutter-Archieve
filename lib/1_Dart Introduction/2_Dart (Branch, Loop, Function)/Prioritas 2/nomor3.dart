void main() {
  List<double> nilai = [10, 40, 50];

  for (double n in nilai) {
    double faktorial = hitungFaktorial(n);
    print("Faktorial dari $n adalah $faktorial");
  }
}

double hitungFaktorial(double n) {
  if (n == 0 || n == 1) {
    return 1;
  } else {
    return n * hitungFaktorial(n - 1);
  }
}
