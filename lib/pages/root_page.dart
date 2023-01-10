import 'package:flutter/material.dart';
import 'package:my_app/pages/chat_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/order_page.dart';
import 'package:my_app/pages/promo_page.dart';

import '../data/constant.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  List<Widget> page = const [
    MyHomePage(),
    PromoPage(),
    OrderPage(),
    ChatPage()
  ];

  int currIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currIndex],
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: grey2,
        currentIndex: currIndex,
        selectedItemColor: green1,
        onTap: (index) => setState(() {
          currIndex = index;
        }),
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
