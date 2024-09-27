import 'package:flutter/material.dart';
import 'package:untitled2/MainScreen/DataCard.dart';

class UsageListView extends StatelessWidget {
  const UsageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75,
      left: 10,
      right: 10,
      bottom: 10,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return DataCard(
                title: "타이틀",
                sub: "서브타이틀",
                cost: -1000 * index,
                path: "assets/icons/list.svg",
                iconIdx: 0,
            );
          },
        ),
      ),
    );
  }
}
