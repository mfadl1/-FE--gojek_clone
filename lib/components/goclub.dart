import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/constant.dart';

class GoClub extends StatelessWidget {
  const GoClub({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
      child: Container(
        height: 65,
        clipBehavior: Clip.hardEdge,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFEAF3F6), Colors.white],
            ),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: grey4)),
        child: Stack(
          children: [
            Positioned(
                left: 8,
                top: 4,
                bottom: 4,
                child: SvgPicture.asset('assets/icons/dots.svg')),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/star.svg',
                    height: 48,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "24 Xp to your next treasure",
                          style: semibold14.copyWith(color: black2),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: grey3,
                          ),
                          child: LinearProgressIndicator(
                            backgroundColor: grey3,
                            color: green1,
                            value: .9,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: grey2,
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
