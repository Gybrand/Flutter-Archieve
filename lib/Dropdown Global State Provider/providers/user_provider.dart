import 'package:flutter/material.dart';

class DatabaseProvider with ChangeNotifier {
  String dbSelect;

  DatabaseProvider({
    this.dbSelect = "TugasAkhir",
  });

  void changeDB({
    required String newDbSelect,
  }) async {
    dbSelect = newDbSelect;
    notifyListeners();
  }
}
