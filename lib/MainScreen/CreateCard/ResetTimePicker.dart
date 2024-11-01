import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/ThemeColor.dart';


class ResetTimePicker extends StatefulWidget {
  ResetTimePicker({super.key});

  static const List<String> ls = [
    "매주",
    "매달",
  ];

  static const List<String> day = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
  static List<String> date = List<String>.generate(31, (index) => "${(index + 1).toString()}일");

  bool isMonth = false;
  int index = 0;

  @override
  State<ResetTimePicker> createState() => _ResetTimePickerState();
}

class _ResetTimePickerState extends State<ResetTimePicker> {
  Widget Picker(List ls, Function func) {
    return CupertinoPicker.builder(
      itemExtent: 35,
      childCount: ls.length,
      useMagnifier: true,
      onSelectedItemChanged: (idx) {
        func(idx);
      },
      selectionOverlay: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: ThemeColor.MainColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ThemeColor.MainColor.withOpacity(0.3), width: 3),
        ),
      ),
      itemBuilder: (ctx, idx) {
        return Container(
          alignment: Alignment.center,
          child: Text(
            ls.elementAt(idx),
            style: const TextStyle(
              color: ThemeColor.MainColor,
              fontSize: 15,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        padding: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ThemeColor.MainColor.withOpacity(0.1),
          border: Border.all(width: 2, strokeAlign: BorderSide.strokeAlignOutside, color: ThemeColor.MainColor),
        ),
        child: Row(
          children: [
            Text(
              "초기화\n날짜",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeColor.MainColor.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)),
            Expanded(
              child: Container(
                height: 80,
                child: Row(
                  children: [
                    Expanded(
                      child: Picker(ResetTimePicker.ls, (idx) {
                        setState(() {
                          log(idx.toString());
                          widget.isMonth = idx == 0 ? false : true;
                        });
                      }),
                    ),
                    Expanded(
                      child: Picker(widget.isMonth ? ResetTimePicker.date : ResetTimePicker.day, (idx) { widget.index = idx; }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
