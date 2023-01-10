import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/constant.dart';
import '../pages/edit_profile_page.dart';
import '../utils/user_secure_storage.dart';

class ProfileComponent extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final Future callback;
  const ProfileComponent(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: green1,
                        ),
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: bold22.copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          email,
                          style: regular16.copyWith(color: grey2),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          phoneNumber,
                          style: regular16.copyWith(color: grey2),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SvgPicture.asset("assets/icons/warga.svg", width: 80),
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () async {
                    await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => const EditProfile(),
                      ),
                    );
                    callback;
                  },
                  child: const Icon(Icons.edit, size: 30),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  await UserSecureStorage.remove("access_token");
                  Navigator.of(context).popUntil(ModalRoute.withName('/welcome'));
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: green1,
                  shape: StadiumBorder(
                    side: BorderSide(color: green1),
                  ),
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Text(
                  "Log out",
                  style: bold16.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
