import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({super.key});

  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
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
            child: Text(
              info.getCurrentData().getName(),
              style: const TextStyle(
                color: ThemeColor.TextColorGrey,
                fontSize: 15,
              ),
            ),
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
            child: Text(
              info.getCurrentData().getMoney().toString(),
              style: TextStyle(
                color: ThemeColor.MainColor,
                fontSize: 25,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 20,
            child: Text(
              '예산 : ${info.getCurrentData().getMax()}',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                color: ThemeColor.MainColor.withOpacity(0.4),
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      )
    );
  }
}
