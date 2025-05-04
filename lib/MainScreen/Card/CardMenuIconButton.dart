
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/ThemeColor.dart';

class CardMenuIconButton extends StatelessWidget {
  late Function _callback;
  ICON _icon = ICON.E_MENU_DELETE;

  CardMenuIconButton(ICON i, Function func) {
    _icon = i;
    _callback = func;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      height: 43,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          splashColor: ThemeColor.MainColor.withOpacity(0.4),
          highlightColor: ThemeColor.MainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            _callback();
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              IconPath.getPath(_icon),
              color: ThemeColor.MainColor,
            ),
          ),
        ),
      ),
    );
  }
}