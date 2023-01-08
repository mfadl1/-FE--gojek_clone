import 'package:flutter/material.dart';

import '../components/profile_component.dart';
import '../data/constant.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
      body: const ProfileComponent(),
    );
  }
}
