void main() {
  int tinggiJamPasir = 6; // Ganti dengan tinggi jam pasir yang diinginkan

  for (int i = 0; i < tinggiJamPasir; i++) {
    String spasi = ' ' * i;
    String angkaNol = '0' * (2 * (tinggiJamPasir - i) - 1);
    print('$spasi$angkaNol');
  }

  for (int i = tinggiJamPasir - 2; i >= 0; i--) {
    String spasi = ' ' * i;
    String angkaNol = '0' * (2 * (tinggiJamPasir - i) - 1);
    print('$spasi$angkaNol');
  }
}
