import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/DataCard.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/ThemeColor.dart';

class UsageListView extends StatelessWidget {

  UsageListView({super.key});

  String date = "";
  bool showDate = false;

  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return Positioned(
      top: 75,
      left: 10,
      right: 10,
      bottom: 10,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          cacheExtent: 1000,
          itemCount: info.getCurrentData().list.length,
          shrinkWrap: false,
          itemBuilder: (ctx, index) {
            int idx = info.getCurrentData().list.length - 1 - index;
            showDate = date != info.getCurrentData().list[idx]['date'].toString();
            date = showDate ? info.getCurrentData().list[idx]['date'].toString() : date;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                index > 0 && showDate ? Container(
                  height: 2,
                  width: double.maxFinite,
                  color: ThemeColor.MainColor,
                  margin: const EdgeInsets.only(top: 5, bottom: 15),
                ) : Container(),
                showDate ? Container(
                  margin: const EdgeInsets.only(bottom: 6),
                  child: Text(
                    date,
                    style: const TextStyle(
                      color: ThemeColor.MainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ) : Container(),
                DataCard(info.getCurrentData().list[idx], idx),
              ],
            );
            // if(date != info.getCurrentData().list[idx]['date'].toString()) {
            //   date = info.getCurrentData().list[idx]['date'].toString();
            //   dateCnt++;
            //   return Text(
            //     date
            //   );
            // } else {
            //   log(idx.toString());
            //   log(info.getCurrentData().list.length.toString());
            //   log(dateCnt.toString());
            //   // idx -= dateCnt;
            //   return DataCard(info.getCurrentData().list[idx], idx);
            // }
          },
        ),
      ),
    );
  }
}
