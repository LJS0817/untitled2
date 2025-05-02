import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 10,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: ThemeColor.MainColor,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            borderRadius: BorderRadius.circular(100),
            highlightColor: Colors.white.withOpacity(0.3),
            splashColor: Colors.white.withOpacity(0.5),
            onTap: () {
              Navigator.pushNamed(context, '/menu').then((value) => log("TEST 123999982100"));
            },
            child: Center(
              child: SizedBox(
                width: 17,
                height: 17,
                child: SvgPicture.asset(
                  IconPath.getPath(ICON.E_MENU_ADD),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}