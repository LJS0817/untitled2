import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';

class AddCardContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return GestureDetector(
      onHorizontalDragEnd: (e) {
        if(e.primaryVelocity! < 0) {
          info.changeCurrentIndex(1);
        } else if(e.primaryVelocity! > 0) {
          info.changeCurrentIndex(-1);
        }
      },
      onTap: () {
        info.setIndex(-1);
      },
      child: Container(
        height: 110,
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: ThemeColor.BackgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(right: 20, left: 20, top: 30, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "새로 추가하기",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: ThemeColor.MainColor,
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 10)),
            SvgPicture.asset(
              IconPath.getPath(ICON.E_MENU_ADD),
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(ThemeColor.MainColor, BlendMode.srcIn),
            )
          ],
        ),
      ),
    );
  }
}