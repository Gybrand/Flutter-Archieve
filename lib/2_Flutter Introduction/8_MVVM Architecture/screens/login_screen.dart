// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_archieve/2_Flutter%20Introduction/8_MVVM%20Architecture/screens/advanced_homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  late SharedPreferences loginData;
  late bool newUser;

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const AdvancedHomePage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Enter your Username",
                      icon: Icon(Icons.person)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Username';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your Email",
                      icon: Icon(Icons.mail)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Email';
                    }
                    final isEmailValidation = EmailValidator.validate(value);
                    if (!isEmailValidation) {
                      return 'Please enter a Valid Email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Enter your Password",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      final isValidForm = formKey.currentState!.validate();

                      String username = _usernameController.text;
                      if (isValidForm) {
                        loginData.setBool('login', false);
                        loginData.setString('username', username);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AdvancedHomePage()),
                          (route) => false,
                        );
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
