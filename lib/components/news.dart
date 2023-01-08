import 'package:flutter/material.dart';

import '../data/constant.dart';
import '../data/data.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...news.map(
          (item) => Padding(
            padding: const EdgeInsets.only(bottom: 24, left: 15, right: 15),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: grey4)),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/${item.image}",
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(item.title ?? "",
                            style: bold16.copyWith(color: Colors.black)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(item.description ?? "",
                            style: regular14.copyWith(color: grey2)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
