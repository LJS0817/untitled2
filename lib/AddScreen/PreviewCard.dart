import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

import '../Utils/ConvertValue.dart';

class PreviewCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CreateUsageProvider data = Provider.of<CreateUsageProvider>(context);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: ThemeColor.BackgroundColor
            ),
            child: Center(
              child: SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset(
                  IconPath.getPathUsingInt(int.parse(data.getData('iconIdx'))),
                  color: ThemeColor.MainColor,
                ),
              ),
            )
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.getData('title'),
                    overflow: TextOverflow.fade,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    data.getData('detail'),
                    style: const TextStyle(
                      height: 0.8,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: ThemeColor.TextColorGrey
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  ConvertValue.costToString(int.parse(data.getData('cost'))),
                  style: const TextStyle(
                    color: ThemeColor.MainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "잔액. ${ConvertValue.costToString(int.parse(data.getData('remain')))}",
                  style: const TextStyle(
                    height: 0.9,
                    color: ThemeColor.TextColorGrey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
