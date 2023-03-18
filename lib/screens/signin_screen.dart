import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../models/user.dart';
import 'home_screen.dart';
import 'login_screen.dart';

const uri = "http://192.168.43.43:5000";

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();

    Future<User> postUser(
        String email, String password, String fullName) async {
      print(email);
      print(password);
      final res = await http.post(
          Uri.parse(
            "$uri/api/events/all",
          ),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(<String, String>{
            'email': email,
            'password': password,
            'fullname': fullName,
          }));
      if (res.statusCode == 201) {
        return User.fromJson(jsonDecode(res.body));
      } else {
        throw Exception('Failed to create album.');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SafeArea(
            child: Center(
              child: Column(children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                            text:
                                "Create your account and become a member of "),
                        TextSpan(
                            text: "HELPY", style: TextStyle(color: Colors.red)),
                        TextSpan(text: "!"),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextField(
                    controller: fullNameController,
                    //obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Full name',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {
                          // action à effectuer lors du clic sur l'icône
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextField(
                    //obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.mail),
                        onPressed: () {
                          // action à effectuer lors du clic sur l'icône
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'password',
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      fillColor: Colors.grey[100],
                      filled: true,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.password),
                        onPressed: () {
                          // action à effectuer lors du clic sur l'icône
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 41),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.grey,
                      height: 1,
                      width: 143,
                    ),
                    const SizedBox(width: 11),
                    const Text(
                      "OR",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(width: 11),
                    Container(
                      color: Colors.grey,
                      height: 1,
                      width: 143,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Action à exécuter lorsque le bouton est cliqué
                      },
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Image.asset(
                              'images/googleicone-removebg-preview.png')),
                    ),
                    const SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        // Action à exécuter lorsque le bouton est cliqué
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 55.0,
                          height: 55.0,
                          decoration: BoxDecoration(
                              color: Colors.grey[100],
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(8.0)),
                          child: Image.asset(
                              "images/fbicone-removebg-preview.png")),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        // Action à exécuter lorsque le bouton est cliqué
                      },
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: 56.0,
                          height: 56.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Image.asset(
                              'images/appleicone-removebg-preview.png')),
                    ),
                  ],
                ),
                const SizedBox(height: 70),
                Builder(
                  builder: (context) {
                    return TextButton(
                      onPressed: () {
                        setState(() {
                          postUser(emailController.text, passwordController.text,
                                fullNameController.text);
                        });
                        
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => HomeScreen()));
                      },
                      child: const Text("Continue"),
                      style: TextButton.styleFrom(
                          fixedSize: const Size(300, 50),
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    );
                  }
                ),
                const SizedBox(height: 30),
                RichText(
                  text: TextSpan(
                    text: 'Do you have an account? ',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Log in!',
                          style: const TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const LoginScreen()));
                            }),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
