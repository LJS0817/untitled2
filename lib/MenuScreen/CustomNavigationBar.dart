import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled2/MenuScreen/BottomButton.dart';

class CustomNavigationBar extends StatelessWidget {
  late Function _closeEvent;
  late Function _addEvent;

  CustomNavigationBar(Function close, Function add, {super.key}) {
    _closeEvent = close;
    _addEvent = add;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomButton("닫기", _closeEvent),
          const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
          BottomButton("추가", _addEvent, swap: true,),
        ],
      ),
    );
  }
}
