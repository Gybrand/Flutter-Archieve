void main() {
  int bilangan = 12;

  if (apakahBilanganPrima(bilangan)) {
    print("bilangan prima");
  } else {
    print("bukan bilangan prima");
  }
}

bool apakahBilanganPrima(int bilangan) {
  if (bilangan <= 1) {
    return false;
  }

  for (int i = 2; i <= bilangan / 2; i++) {
    if (bilangan % i == 0) {
      return false;
    }
  }

  return true;
}
