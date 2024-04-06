class Hewan {
  double? berat;

  Hewan(double berat) {
    this.berat = berat;
  }
}

void main() {
  Hewan kucing = Hewan(10.5);
  Hewan anjing = Hewan(7.0);

  print('Berat kucing: ${kucing.berat} kg');
  print('Berat anjing: ${anjing.berat} kg');
}
