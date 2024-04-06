import 'dart:math';

void main() {
  //Nomor 1
  print("Nomor 1");
  String kata = "mobil balap";
  String kataTanpaSpasi = kata.replaceAll(' ', '').toLowerCase();
  String kataTerbalik = kataTanpaSpasi.split('').reversed.join('');

  if (kataTanpaSpasi == kataTerbalik) {
    print("palindrom");
  } else {
    print("bukan palindrom");
  }

  //Nomor 2
  print("\n");
  print("Nomor 2");
  int bilangan = 24;
  print("Faktor dari $bilangan adalah:");

  for (int i = 1; i <= bilangan; i++) {
    if (bilangan % i == 0) {
      print(i);
    }
  }

  //Nomor 3
  print("\n");
  print("Nomor 3");
  double sisi = 39.0; // Panjang sisi persegi
  double kelilingp = 4 * sisi;
  double luasp = sisi * sisi;

  print("Keliling persegi: $kelilingp");
  print("Luas persegi: $luasp");

  //Keliling dan luas Persegi Panjang
  double panjang = 39.0;
  double lebar = 7.0;

  double kelilingpp = 2 * (panjang + lebar);
  double luaspp = panjang * lebar;

  print("Keliling persegi panjang: $kelilingpp");
  print("Luas persegi panjang: $luaspp");

  //Nomor 4
  print("\n");
  print("Nomor 4");
  double radius = 39.0;
  double keliling = 2 * pi * radius;
  double luas = pi * radius * radius;

  print("Keliling lingkaran: $keliling");
  print("Luas lingkaran: $luas");

  //Nomor 5
  print("\n");
  print("Nomor 5");
  String x = "Fikli";
  String y = "Al Fa'iq";
  String z = "Gyonanda";

  String hasil = x + " " + y + " " + z;
  print(hasil);

  //Nomor 6
  print("\n");
  print("Nomor 6");
  double jariJari = 2.0;
  double tinggi = 10.0;

  double volume = pi * pow(jariJari, 2) * tinggi;

  print("Volume tabung: $volume");
}
