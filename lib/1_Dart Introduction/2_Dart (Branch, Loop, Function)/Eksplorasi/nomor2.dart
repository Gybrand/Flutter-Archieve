import 'dart:io';

void main() {
  cetakTabelPerkalian();
}

void cetakTabelPerkalian() {
  for (int i = 1; i <= 9; i++) {
    for (int j = 1; j <= 9; j++) {
      int hasil = i * j;
      String hasilFormatted = hasil.toString().padLeft(4);
      stdout.write(hasilFormatted);
    }
    print("");
  }
}
