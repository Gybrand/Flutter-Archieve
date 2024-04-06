import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/model/contact_model.dart';
import 'package:dio/dio.dart';

class ContactAPI {
  static Future<List<Contact>> getContacts() async {
    final response = await Dio().get(
      'https://my-json-server.typicode.com/hadihammurabi/flutter-webservice/contacts',
    );

    List<Contact> contacts = (response.data as List)
        .map(
          (e) => Contact(id: e['id'], name: e['name'], phone: e['phone']),
        )
        .toList();
    return contacts;
  }
}
