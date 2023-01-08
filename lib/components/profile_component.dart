import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../data/constant.dart';
import '../pages/edit_profile_page.dart';

class ProfileComponent extends StatelessWidget {
  const ProfileComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
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
                      "Fadli Gunardi",
                      style: bold22.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "m.fadli.gunardi@gmail.com",
                      style: regular16.copyWith(color: grey2),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      "081214840380",
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
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const EditProfile(),
                ),
              ),
              child: const Icon(Icons.edit, size: 30),
            )
          ],
        ),
      ),
    );
  }
}
