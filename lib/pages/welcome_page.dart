import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../data/constant.dart';
import '../data/data.dart';
import 'login.dart';
import 'signup.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currIndex = 0;

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/images/Gojek.png",
                width: 100,
              ),
              SizedBox(
                width: 110,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: grey4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.translate, color: grey4),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "English",
                        style: regular16.copyWith(color: grey1),
                      ),
                    ],
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CarouselSlider.builder(
                  options: CarouselOptions(
                    viewportFraction: 1,
                    height: 330,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) => setState(() {
                      currIndex = index;
                    }),
                  ),
                  itemCount: welcomeCarousel.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: Column(
                        children: [
                          Image.asset(
                              "assets/images/${welcomeCarousel[index].image}.png"),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            welcomeCarousel[index].title,
                            style: bold24,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            welcomeCarousel[index].description,
                            style: regular16.copyWith(color: grey2, fontSize: 18),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    );
                  },
                ),
                DotsIndicator(
                  dotsCount: welcomeCarousel.length,
                  position: currIndex.toDouble(),
                  decorator: DotsDecorator(color: grey1, activeColor: green1),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => const Login(),
                          ),
                        ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => const SignUp(),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          foregroundColor: green1,
                          shape: StadiumBorder(
                            side: BorderSide(color: green1),
                          ),
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          "Sign up",
                          style: bold16,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 350,
                          child: RichText(
                            text: TextSpan(
                              style: regular14.copyWith(color: grey2),
                              children: [
                                const TextSpan(
                                    text:
                                        "By logging in our registering, you agree to our "),
                                TextSpan(
                                    text: "Terms of service ",
                                    style: regular14.copyWith(color: green1)),
                                const TextSpan(text: "and "),
                                TextSpan(
                                    text: "Privacy policy",
                                    style: regular14.copyWith(color: green1)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
