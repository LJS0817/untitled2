import 'package:flutter/material.dart';
import 'package:untitled2/MainScreen/SpendList.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/MainScreen/TitleCard.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StartWidget(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            TitleCard(),
            SpendList(),
          ],
        ),
      ),
    );
  }
}