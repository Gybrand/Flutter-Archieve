class Mobil {
  double kapasitas;
  List<double> muatan = [];

  Mobil(this.kapasitas);

  void tambahMuatan(double berat) {
    if ((totalMuatan() + berat) <= kapasitas) {
      muatan.add(berat);
      print('Muatan berhasil ditambahkan.');
    } else {
      print('Kapasitas muatan penuh, muatan tidak dapat ditambahkan.');
    }
  }

  double totalMuatan() {
    double total = 0;
    for (var berat in muatan) {
      total += berat;
    }
    return total;
  }
}

void main() {
  Mobil mobil = Mobil(10.0);
  mobil.tambahMuatan(5.0);
  mobil.tambahMuatan(7.5);

  print('Total muatan mobil: ${mobil.totalMuatan()} kg');
}
