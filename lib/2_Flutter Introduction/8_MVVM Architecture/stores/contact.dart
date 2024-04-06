import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/model/model.dart';

class Contact with ChangeNotifier {
  final List<GetContact> _contacts = [];
  List<GetContact> get contacts => _contacts;

  void add(GetContact contact) {
    _contacts.add(contact);
    notifyListeners();
  }
}
