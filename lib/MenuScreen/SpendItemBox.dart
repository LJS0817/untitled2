import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

import '../Utils/ConvertValue.dart';

class SpendItemBox extends StatelessWidget {
  int index = 0;
  late CustomDataframe data;

  Color backgroundColor = Colors.white;
  Color titleColor = Colors.black;
  Color subTitleColor = ThemeColor.TextColorGrey;
  Color costColor = ThemeColor.MainColor;

  final double radius = 20;

  SpendItemBox(CustomDataframe frame, int idx, {super.key}) {
    index = idx;
    data = frame;
  }

  Widget SpendItemLongTapButton(ICON iName) {
    return Expanded(
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white.withOpacity(0.6),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            highlightColor: Colors.white,
            onTap: () {
              
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                IconPath.getPath(iName),
                color: ThemeColor.MainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  child: Text(
                    data.getTitle(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: titleColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  child: Text(
                    data.getDetail(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: subTitleColor,
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ThemeColor.MainColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        IconPath.getPathUsingInt(data.getIconIdx()),
                        color: ThemeColor.MainColor,
                      ),
                    )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    ConvertValue.costToString(data.getCost()),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: costColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(radius),
                highlightColor: ThemeColor.MainColor.withOpacity(0.3),
                splashColor: ThemeColor.MainColor.withOpacity(0.2),
                onTap: () {
                  if(backgroundColor == ThemeColor.MainColor) {
                    backgroundColor = Colors.white;
                    titleColor = Colors.black;
                    subTitleColor = ThemeColor.TextColorGrey;
                    costColor = ThemeColor.MainColor;
                  }
                  info.changeState();
                },
                onLongPress: () {
                  if(backgroundColor == Colors.white) {
                    backgroundColor = ThemeColor.MainColor;
                    titleColor = Colors.white;
                    subTitleColor = Colors.white.withOpacity(0.55);
                    costColor = Colors.transparent;
                  }
                  // } else {
                  //   backgroundColor = Colors.white;
                  //   titleColor = Colors.black;
                  //   subTitleColor = ThemeColor.TextColorGrey;
                  //   costColor = ThemeColor.MainColor;
                  // }
                  info.changeState();
                },
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Visibility(
              visible: backgroundColor != Colors.white,
              child: Row(
                children: [
                  SpendItemLongTapButton(ICON.E_MENU_EDIT),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  SpendItemLongTapButton(ICON.E_MENU_DELETE),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
