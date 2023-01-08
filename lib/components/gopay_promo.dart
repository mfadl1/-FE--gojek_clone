import 'package:flutter/material.dart';

import '../data/constant.dart';
import '../data/data.dart';

class GopayPromo extends StatelessWidget {
  const GopayPromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 15, right: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/gopay.png',
                  height: 16,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Tips awal tahun lebih hemat 💰",
                  style: bold16.copyWith(color: Colors.black),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  "Nikmati cashback s.d. 20% untuk pembayaran tagihan dan diskon 2RB untuk pembelian pulsa.",
                  style: regular14.copyWith(color: grey2),
                ),
              ],
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              const SizedBox(width: 15),
              ...promos.map(
                (item) => Padding(
                  padding: const EdgeInsets.only(right: 15, bottom: 20),
                  child: Container(
                    height: 170,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset("assets/images/${item.image}"),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
