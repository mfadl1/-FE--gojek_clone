import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/constant.dart';
import '../data/data.dart';

class GojekMenu extends StatelessWidget {
  const GojekMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32, left: 27, right: 27),
      child: SizedBox(
        height: 160,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 4,
          mainAxisSpacing: 8,
          children: [
            ...menuIcons.map(
              (icon) => Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(6),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: icon.color,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/${icon.icon}.svg',
                        color: icon.icon == 'goclub'
                            ? purple
                            : icon.icon == 'lainnya'
                                ? grey2
                                : Colors.white,
                        width: 24,
                      )),
                  const SizedBox(
                    height: 9,
                  ),
                  Text(
                    icon.title,
                    style: regular.copyWith(color: grey2),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
