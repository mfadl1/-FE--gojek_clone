import 'dart:convert';

import 'package:flutter/material.dart';

import '../components/profile_component.dart';
import '../data/constant.dart';
import '../services/http.dart';
import '../utils/user_secure_storage.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = "";
  String email = "";
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future getUserData() async {
    var userId = await UserSecureStorage.getId();
    var response = await BaseClient.post('/me/$userId', {});
    var res = jsonDecode(response.body);

    setState(() {
      name = res['name'];
      email = res['email'];
      phoneNumber = res['phone_number'];
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
        title: Text(
          "My Profile",
          style: bold22.copyWith(color: Colors.black),
        ),
      ),
      body: ProfileComponent(
        name: name,
        email: email,
        phoneNumber: phoneNumber,
        callback: getUserData(),
      ),
    );
  }
}
