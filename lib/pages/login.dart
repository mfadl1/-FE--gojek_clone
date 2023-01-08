import 'package:flutter/material.dart';

import '../Validator/form_validation.dart';
import '../data/constant.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

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
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Login",
                  style: bold22.copyWith(color: black2),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "You can log in if you already have an Gojek account.",
                  style: regular16.copyWith(color: grey2),
                ),
                const SizedBox(
                  height: 30,
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
                    hintStyle: semibold14.copyWith(color: grey1, fontSize: 18),
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
                    hintStyle: semibold14.copyWith(color: grey1, fontSize: 18),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: green1,
                      shape: const StadiumBorder(),
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: Text(
                      "Log in",
                      style: bold16,
                    ),
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
