hitungDiskon(totalHarga, diskon) {
  return totalHarga * diskon;
}

hitungTotalHarga(buku, pensil, tas) {
  return buku + pensil + tas;
}

void main() {
  var buku = 10000;
  var pensil = 5000;
  var tas = 100000;

  var totalHarga = hitungTotalHarga(buku, pensil, tas);
  var diskon = 0.10;

  var totalDiskon = hitungDiskon(totalHarga, diskon);
  var hargaSetelahDiskon = totalHarga - totalDiskon;

  print("Total harga: $totalHarga");
  print("Total diskon: $totalDiskon");
  print("Harga setelah diskon: $hargaSetelahDiskon");
}
