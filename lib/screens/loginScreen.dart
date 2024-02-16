// ignore_for_file: prefer_const_constructors, file_names, prefer_const_declarations

import 'package:database/screens/homeScreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(17.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'username',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'username is empty';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'password is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Visibility(
                      //   // visible: !isMatched,
                      //   child: Text(
                      //     'Username and password doesn\'t match',
                      //     style: TextStyle(color: Colors.red),
                      //   ),
                      // ),
                      ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                Color.fromARGB(255, 48, 116, 189))),
                        onPressed: () {
                          formKey.currentState!.validate();
                          checkLogin(context);
                        },
                        child: Text('Login'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    final userName = usernameController.text;
    final passWord = passwordController.text;

    if (userName == passWord) {
      //go to home
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Homescreen()));
    } else {
      final error1 = 'username and password doesn\'t match';

      // //snackbar
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //       backgroundColor: Colors.red,
      //       behavior: SnackBarBehavior.floating,
      //       content: Text(error1)),
      // );

      showDialog(
          context: context,
          builder: (context1) {
            return AlertDialog(
              title: Text('Error'),
              content: Text(error1),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context1).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          });
      //show text passwordMatched
      // setState(() {
      //   isMatched = false;
      // });
    }
  }
}
