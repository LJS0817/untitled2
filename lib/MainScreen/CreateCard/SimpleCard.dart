import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/CreateInfoProvider.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({super.key});

  Widget getDate(String sKey, Color? color, double? size, FontWeight? w, {String str=""}) {
    return Selector<CreateInfoProvider, String>(
      selector: (cxt, info) => info.getInfo(sKey),
      builder: (cxt, val, c) {
        return Text(
          str + (sKey != "name" ? ConvertValue.costToString(int.parse(val)).toString() : val),
          style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: w
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      decoration: BoxDecoration(
        color: ThemeColor.BackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Container(
              height: 10,
              color: ThemeColor.MainColor,
            )
          ),
          Positioned(
            top: 15,
            left: 20,
            child: getDate("name", ThemeColor.TextColorGrey, 15, FontWeight.normal)
          ),
          Positioned(
            bottom: 85,
            left: 20,
            child: Text(
              '잔고',
              style: TextStyle(
                color: ThemeColor.MainColor.withOpacity(0.7),
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 50,
            left: 20,
            child: getDate("current", ThemeColor.MainColor, 25, FontWeight.w600)
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: getDate("budget", ThemeColor.MainColor.withOpacity(0.4), 15, FontWeight.w600, str: "예산 : ")
          ),
        ],
      )
    );
  }
}
