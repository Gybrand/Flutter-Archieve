double LuasLingkaran(double jariJari) {
  return 3.14 * jariJari * jariJari; // Penghitungan luas lingkaran
}

void main() {
  double jariJari = 10.0; // Ganti dengan jari-jari lingkaran yang diinginkan
  double luas = LuasLingkaran(jariJari);

  print("Luas lingkaran dengan jari-jari $jariJari adalah $luas");
}
