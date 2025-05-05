import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Mng/IconPath.dart';

import '../../ThemeColor.dart';

class AddCardMiniIcon extends StatelessWidget {
  AddCardMiniIcon(this.isFocused, {super.key});

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Text(
        "+",
        style: TextStyle(
          fontSize: 16,
          color: isFocused ? ThemeColor.MainColor : ThemeColor.TextColorGrey,
          fontWeight: FontWeight.bold,
          height: 0.8,
        ),
      ),
    );
  }
}
