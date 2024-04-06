import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/model/api/contact_api.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/model/contact_model.dart';
import 'package:flutter/material.dart';

class ContactViewModel with ChangeNotifier {
  List<Contact> _contacts = [];

  // Getter
  List<Contact> get contacts => _contacts;

  // Setter
  getContacts() async {
    final c = await ContactAPI.getContacts();
    _contacts = c;
    notifyListeners();
  }
}
