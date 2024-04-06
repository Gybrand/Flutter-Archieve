import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/contact/contact_viewmode.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  void initState() {
    super.initState();
    final modelView = Provider.of<ContactViewModel>(context, listen: false);
    modelView.getContacts();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final modelView = Provider.of<ContactViewModel>(context, listen: false);
      modelView.getContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ContactViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contact List'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: modelView.contacts.length,
        itemBuilder: (context, index) {
          final contact = modelView.contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
          );
        },
      ),
    );
  }
}
