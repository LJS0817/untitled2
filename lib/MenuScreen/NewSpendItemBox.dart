import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/ThemeColor.dart';

class NewSpendItemBox extends StatelessWidget {
  NewSpendItemBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          highlightColor: ThemeColor.MainColor.withOpacity(0.3),
          splashColor: ThemeColor.MainColor.withOpacity(0.4),
          onTap: () {
            Navigator.pushNamed(context, "/menu/add");
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "새로 만들기",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(bottom: 5)),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: ThemeColor.MainColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(13),
                  child: SvgPicture.asset(
                    IconPath.getPath(ICON.E_MENU_ADD),
                    color: ThemeColor.MainColor,
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
