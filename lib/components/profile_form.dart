import 'package:flutter/material.dart';

import '../Validator/form_validation.dart';
import '../data/constant.dart';

class ProfileForm extends StatelessWidget {
  final TextEditingController name;
  final TextEditingController phoneNumber;
  final TextEditingController email;
  final TextEditingController password;
  const ProfileForm({super.key, required this.name,required this.phoneNumber, required this.email, required this.password});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          controller: name,
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
              const TextSpan(text: "Phone number"),
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
      ],
    );
  }
}
