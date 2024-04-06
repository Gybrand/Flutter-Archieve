import "package:flutter/material.dart";

class FlutterForm extends StatefulWidget {
  const FlutterForm({super.key});

  @override
  State<FlutterForm> createState() => _FlutterFormState();
}

class _FlutterFormState extends State<FlutterForm> {
  var formKey = GlobalKey<FormState>();
  String? name = '';
  String? nomor = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contacts',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Create New Contacts',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Isi data di bawah ini',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      hintText: 'Insert your Name',
                      filled: true,
                      fillColor: Color.fromARGB(255, 222, 211, 226),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 186, 0, 199),
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      name = value;
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Nomor',
                      hintText: '+62...',
                      filled: true,
                      fillColor: Color.fromARGB(255, 222, 211, 226),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 186, 0, 199),
                          width: 2.0,
                        ),
                      ),
                    ),
                    validator: (value) {
                      nomor = value;
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Phone Number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 92, 0, 178)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Data berhasil disimpan"),
                              ),
                            );
                            print(name);
                            print(nomor);
                            //formKey.currentState!.reset();
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            children: [
              /* Container(
                padding: const EdgeInsets.all(20.0),
                child: const ListTile(
                  title: Text('Name'),
                  subtitle: Row(
                    children: [Text("Nomor")],
                  ),
                ),
              ) */
            ],
          ),
        ],
      )),
    );
  }
}
