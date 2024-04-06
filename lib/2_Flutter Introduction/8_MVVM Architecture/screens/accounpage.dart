import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var formKey = GlobalKey<FormState>();
  //Login
  late SharedPreferences loginData;
  String username = '';
  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Account Info'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Selamat Datang'),
                      Text('Username: $username'),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          loginData.setBool('login', true);
                          loginData.remove('username');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Log Out'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
