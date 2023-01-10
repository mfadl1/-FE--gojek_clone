import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_app/Validator/form_validation.dart';
import '../data/constant.dart';
import '../services/http.dart';
import '../utils/user_secure_storage.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  late int httpStatusCode;
  late String message;

  editProfile() async {
    var userId = await UserSecureStorage.getId();
    var response = await BaseClient.post('/edit-profile/$userId', {
      "name": nameController.text,
      "phone_number": phoneNumberController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    var res = jsonDecode(response.body);
    setState(() {
      httpStatusCode = response.statusCode;
      message = res['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
              Text(
                "Edit Profile",
                style: bold16.copyWith(fontSize: 18, color: Colors.black),
              ),
              SizedBox(
                height: 40,
                width: 70,
                child: TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await editProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(message, textAlign: TextAlign.center),
                          backgroundColor:
                              httpStatusCode == 400 ? Colors.red : green1,
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
                    "Save",
                    style: semibold14.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile Image",
                        style: semibold14,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: green1,
                              ),
                              child: const Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                              constraints: const BoxConstraints(maxWidth: 300),
                              child: Text(
                                "Put your best pic! Everyone will be able to see it.",
                                style: regular14.copyWith(fontSize: 18),
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        " Add a pic",
                        style: regular14.copyWith(color: grey2),
                      ),
                    ],
                  ),
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
                          hintStyle:
                              semibold14.copyWith(color: grey1, fontSize: 18),
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
                          hintStyle:
                              semibold14.copyWith(color: grey1, fontSize: 18),
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
                          hintStyle:
                              semibold14.copyWith(color: grey1, fontSize: 18),
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
                          hintStyle:
                              semibold14.copyWith(color: grey1, fontSize: 18),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
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
