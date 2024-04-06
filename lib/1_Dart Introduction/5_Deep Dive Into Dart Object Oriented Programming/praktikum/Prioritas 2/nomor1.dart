class Matematika
    implements KelipatanPersekutuanTerkecil, KelipatanPersekutuanTerbesar {
  int x;
  int y;

  Matematika(this.x, this.y);

  @override
  int hasilKPTerkecil() {
    int max = x > y ? x : y;
    while (true) {
      if (max % x == 0 && max % y == 0) {
        return max;
      }
      max++;
    }
  }

  @override
  int hasilKPTerbesar() {
    int min = x < y ? x : y;
    while (min >= 1) {
      if (x % min == 0 && y % min == 0) {
        return min;
      }
      min--;
    }
    return 1;
  }
}

abstract class KelipatanPersekutuanTerkecil {
  int hasilKPTerkecil();
}

abstract class KelipatanPersekutuanTerbesar {
  int hasilKPTerbesar();
}

void main() {
  Matematika matematika = Matematika(5, 8);

  print("KPTerkecil: ${matematika.hasilKPTerkecil()}");
  print("KPTerbesar: ${matematika.hasilKPTerbesar()}");
}
