void main() {
  int tinggiPiramida = 8;

  for (int i = 1; i <= tinggiPiramida; i++) {
    String bintang = '   ' * (tinggiPiramida - i) + ' * ' * (2 * i - 1);
    print(bintang);
  }
}
