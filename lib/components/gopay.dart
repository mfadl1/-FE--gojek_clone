import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../data/constant.dart';
import '../data/data.dart';

class GopaySection extends StatefulWidget {
  const GopaySection({super.key});

  @override
  State<GopaySection> createState() => _GopaySectionState();
}

class _GopaySectionState extends State<GopaySection> {
  int currIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        height: 96,
        decoration: BoxDecoration(
          color: blue1,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 10),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 3; i++)
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      width: 2,
                      height: 8,
                      decoration: BoxDecoration(
                          color: currIndex == i ? Colors.white : grey3,
                          borderRadius: BorderRadius.circular(1)),
                    )
                ],
              ),
              CarouselSlider.builder(
                options: CarouselOptions(
                  initialPage: 3,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.vertical,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) => setState(() {
                    currIndex = index;
                  }),
                ),
                itemCount: gopaydata.length,
                itemBuilder: (context, index, realIndex) {
                  return Column(
                    children: [
                      Container(
                        height: 67,
                        width: 134,
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        decoration: BoxDecoration(
                          color: index == currIndex ? Colors.white : blue3,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/${gopaydata[index].image}.png",
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              gopaydata[index].balance,
                              style: index == 1
                                  ? regular.copyWith(color: grey2)
                                  : bold16.copyWith(color: black2),
                            ),
                            Text(
                              gopaydata[index].description,
                              style: semibold12.copyWith(color: green3),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
              ...gopayIcons.map(
                (item) => Flexible(
                  fit: FlexFit.tight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/${item.icon}.svg",
                          color: blue1,
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        item.title,
                        style: semibold14.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
