//Tugas Percabangan (Branching)
void main() {
  int nilai = 39;

  String hasil = evaluasiNilai(nilai);
  print("Hasil evaluasi: $hasil");
}

String evaluasiNilai(int nilai) {
  if (nilai > 70) {
    return "Nilai A";
  } else if (nilai > 40) {
    return "Nilai B";
  } else if (nilai > 0) {
    return "Nilai C";
  } else {
    return "";
  }
}
