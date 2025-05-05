
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../ThemeColor.dart';

class CardMiniDot extends StatelessWidget {
  CardMiniDot(this.isFocused, {super.key});

  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 100.ms,
      width: 8,
      height: 8,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isFocused ? ThemeColor.MainColor : ThemeColor.TextColorGrey,
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}