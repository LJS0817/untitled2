import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class TitleCard extends StatelessWidget {
  String title = "누구 카드";
  DateTime date = DateTime.now();

  int money = 100000;
  int total = 300000;

  TitleCard(InfoDataframe? data, {super.key}) {
    money = data!.getMoney();
    total = data.getMax();
    title = data.getName();
  }

  String getDate() {
    return "${date.month < 10 ? "0" : ""}${date.month}.${date.day < 10 ? "0" : ""}${date.day}";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
        decoration: BoxDecoration(
          color: ThemeColor.BackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ThemeColor.TextColorGrey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ConvertValue.costToString(money),
                        style: const TextStyle(
                          color: ThemeColor.MainColor,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "예산  ${ConvertValue.costToString(total)}",
                        style: TextStyle(
                          color: ThemeColor.MainColor.withOpacity(0.4),
                          fontSize: 15,
                          height: 0.8,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 50,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeColor.MainColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                IconPath.getPath(ICON.E_MENU_EDIT),
                color: Colors.white,
              ),
            )
          )
        ],
      ),
    );
  }
}
