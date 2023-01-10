import 'dart:convert';

import 'package:flutter/material.dart';

import '../Validator/form_validation.dart';
import "package:http/http.dart" as http;
import '../data/constant.dart';
import '../services/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late int httpStatusCode;
  late String message;

  register() async {
    var response = await BaseClient.post('/auth/register', {
      "name": nameController.text,
      "phone_number": phoneNumberController.text,
      "email": emailController.text,
      "password": passwordController.text,
    }, 
      middleware: false
    );

    var res = jsonDecode(response.body);
    setState(() {
      httpStatusCode = response.statusCode;
      message = res['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 70,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/Gojek.png",
                width: 100,
              ),
              Icon(
                Icons.help,
                color: grey2,
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign up",
                      style: bold22.copyWith(color: black2),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You can make an account if you're new to Gojek.",
                      style: regular16.copyWith(color: grey2),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: bold14.copyWith(color: grey2),
                              children: [
                                const TextSpan(text: "Name"),
                                TextSpan(
                                  text: "*",
                                  style: bold14.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name required';
                              }
                              if (value.length < 3 || value.length > 30) {
                                return 'Name length must be 3-30 characters';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Latin alphabet, no emoji or symbols",
                              hintStyle: semibold14.copyWith(
                                  color: grey1, fontSize: 18),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: bold14.copyWith(color: grey2),
                              children: [
                                const TextSpan(text: "Phone number"),
                                TextSpan(
                                  text: "*",
                                  style: bold14.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number required';
                              }
                              if (!value.isValidPhone) {
                                return 'Phone number must be a number';
                              }
                              if (value.length < 7) {
                                return 'Phone number length is at least 7 numbers';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "08xxxxxxxx",
                              hintStyle: semibold14.copyWith(
                                  color: grey1, fontSize: 18),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: bold14.copyWith(color: grey2),
                              children: [
                                const TextSpan(text: "Email"),
                                TextSpan(
                                  text: "*",
                                  style: bold14.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email required';
                              }
                              if (!value.isValidEmail) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "e.g. name@gmail.com",
                              hintStyle: semibold14.copyWith(
                                  color: grey1, fontSize: 18),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          RichText(
                            text: TextSpan(
                              style: bold14.copyWith(color: grey2),
                              children: [
                                const TextSpan(text: "Password"),
                                TextSpan(
                                  text: "*",
                                  style: bold14.copyWith(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                            controller: passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password required';
                              }
                              if (value.length < 6) {
                                return 'Password length is at least 6 characters';
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: "minimum 6 characters",
                              hintStyle: semibold14.copyWith(
                                  color: grey1, fontSize: 18),
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await register();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text(message, textAlign: TextAlign.center),
                                backgroundColor:
                                    httpStatusCode == 200 ? green1 : Colors.red,
                                behavior: SnackBarBehavior.floating,
                                duration: const Duration(seconds: 2),
                              ),
                            );

                            if (httpStatusCode == 200) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: green1,
                          shape: const StadiumBorder(),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          "Sign up",
                          style: bold16,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
