import 'package:flutter/material.dart';
import 'package:untitled2/MainScreen/Usage/UsageListView.dart';
import 'package:untitled2/MainScreen/Usage/BackgroundWidget.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/MainScreen/Usage/CircleButton.dart';

class SpendList extends StatelessWidget {
  const SpendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: Stack(
          children: [
            const BackgroundWidget(),
            const CircleButton(),
            UsageListView(),
          ],
        ),
      ),
    );
  }
}
