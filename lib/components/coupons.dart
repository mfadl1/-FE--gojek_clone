import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/constant.dart';
import '../data/data.dart';

class Coupons extends StatelessWidget {
  const Coupons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(width: 15),
          ...coupons.map(
            (item) => Padding(
              padding: const EdgeInsets.only(right: 15, top: 20),
              child: Container(
                width: 250,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: grey4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: semibold14.copyWith(color: black2),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset("assets/icons/${item.icon1}"),
                              if (item.icon1 != null) const SizedBox(width: 10),
                              Text(
                                item.description,
                                style: regular14.copyWith(color: grey2),
                              ),
                            ],
                          )
                        ],
                      ),
                      SvgPicture.asset("assets/icons/${item.icon2}")
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
