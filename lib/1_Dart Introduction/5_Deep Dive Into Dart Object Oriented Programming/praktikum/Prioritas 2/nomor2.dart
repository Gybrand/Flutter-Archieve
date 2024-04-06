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

  int hasil() {
    // Contoh operasi apapun yang ingin Anda lakukan dengan x dan y
    return x * y;
  }
}

abstract class KelipatanPersekutuanTerkecil {
  int hasilKPTerkecil();
}

abstract class KelipatanPersekutuanTerbesar {
  int hasilKPTerbesar();
}

void main() {
  Matematika operation = Matematika(5, 8);
  print("KPTerkecil: ${operation.hasilKPTerkecil()}");
  print("KPTerbesar: ${operation.hasilKPTerbesar()}");

  print(operation.hasil());
}
