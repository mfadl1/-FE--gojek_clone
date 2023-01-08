import 'package:flutter/material.dart';
import '../components/edit_profile_form.dart';
import '../data/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

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
                  onPressed: () {
                    if (_formKey.currentState!.validate())
                    {
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
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: EditProfileForm()
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
