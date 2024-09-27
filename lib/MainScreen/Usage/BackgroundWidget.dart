import 'package:flutter/material.dart';
import 'package:untitled2/ThemeColor.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: ThemeColor.BackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: const Text(
          "사용 내역",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
