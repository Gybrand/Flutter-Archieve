import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/accounpage.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/blocpage.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/contact/contact_screen.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/gallery.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/model/model.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/pickpage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/stores/contact.dart'
    as contact_store;

class AdvancedHomePage extends StatefulWidget {
  const AdvancedHomePage({super.key});

  @override
  State<AdvancedHomePage> createState() => _AdvancedHomePageState();
}

class _AdvancedHomePageState extends State<AdvancedHomePage> {
  String name = '';
  String phoneNumber = '';
  var nameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactProvider = Provider.of<contact_store.Contact>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Phone Book App'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: const EdgeInsets.only(top: 50),
          children: [
            ListTile(
              title: const Text('Contact List'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactPage()),
                );
              },
            ),
            ListTile(
              title: const Text('PickPage'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PickPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Gallery'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Gallery()),
                );
              },
            ),
            ListTile(
              title: const Text('BLoc'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BLocPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Account'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.person,
                      size: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Create New Contact',
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      'Isi data di bawah ini',
                      style: TextStyle(fontSize: 15),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text('Name')),
                      controller: nameController,
                      onChanged: (String value) {
                        name = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          label: Text('Phone Number')),
                      controller: phoneNumberController,
                      onChanged: (String value) {
                        phoneNumber = value;
                      },
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;

                  formKey.currentState!.save();
                  contactProvider.add(
                    GetContact(name: name, phoneNumber: phoneNumber),
                  );
                },
                child: const Text('Add Number'),
              ),
              Container(
                height: 200,
                child: Expanded(
                  child: Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: contactProvider.contacts.length,
                      itemBuilder: (context, index) {
                        if (index < contactProvider.contacts.length) {
                          return ListTile(
                            title: Text(contactProvider.contacts[index].name),
                            subtitle: Text(
                                contactProvider.contacts[index].phoneNumber),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
