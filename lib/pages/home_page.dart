import 'package:flutter/material.dart';

import '../components/coupons.dart';
import '../components/goclub.dart';
import '../components/gojek_menu.dart';
import '../components/gopay.dart';
import '../components/gopay_promo.dart';
import '../components/news.dart';
import '../data/constant.dart';
import 'profile_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: green1,
        toolbarHeight: 70,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: black1,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Find services, food, or places',
                      style: regular14.copyWith(color: grey1),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => const Profile(),
                ),
              ),
              child: SizedBox(
                width: 40,
                height: 40,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    color: green1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            GopaySection(),
            GojekMenu(),
            GoClub(),
            Coupons(),
            GopayPromo(),
            NewsList(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: grey2,
        selectedItemColor: green1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.discount),
            label: "Promos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chat",
          ),
        ],
      ),
    );
  }
}
