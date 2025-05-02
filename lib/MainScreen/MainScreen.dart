import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/CreateCard/CreateCard.dart';
import 'package:untitled2/MainScreen/SpendList.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/MainScreen/TitleCard.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    InfoMng info = context.watch<InfoMng>();
    return StartWidget(
        child: FutureBuilder(
          future: info.loadData(context),
          builder: (cxt, snap) {
            if(snap.hasData || info.existData()) {
              // log("TEST    +   " + snap.data!.toMap().toString());
              return Container(
                color: Colors.white,
                child: Column(
                  children: [
                    TitleCard(),
                    SpendList(),
                  ],
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  log("OUT");
                },
                child: Container(
                  color: Colors.white,
                  height: double.maxFinite,
                  child: CreateCard(),
                ),
              );
            }
          },
        )
      // child: Selector<InfoMng, InfoDataframe>(
      //   selector: (context, info) => info.getCurrentData(),
      //   builder: (context, data, child) {
      //     return Container(
      //       color: Colors.white,
      //       child: Column(
      //         children: [
      //           TitleCard(data),
      //           SpendList(),
      //         ],
      //       ),
      //     );
      //   },
      // ),
      // child: FutureBuilder(
      //   future: context.read<InfoMng>().readCurrentData(),
      //   builder: (cxt, snap) {
      //     return Container(
      //       color: Colors.white,
      //       child: Column(
      //         children: [
      //           TitleCard(),
      //           SpendList(),
      //         ],
      //       ),
      //     );
      //     // if(snap.hasData) {
      //     //   if(snap.data == true) {
      //     //     return Container(
      //     //       color: Colors.white,
      //     //       child: Column(
      //     //         children: [
      //     //           TitleCard(),
      //     //           SpendList(),
      //     //         ],
      //     //       ),
      //     //     );
      //     //   } else {
      //     //     return GestureDetector(
      //     //       onTap: () {
      //     //         FocusManager.instance.primaryFocus?.unfocus();
      //     //         log("OUT");
      //     //       },
      //     //       child: Container(
      //     //         color: Colors.white,
      //     //         height: double.maxFinite,
      //     //         child: CreateCard(),
      //     //       ),
      //     //     );
      //     //   }
      //     // } else {
      //     //   return Container(
      //     //     child: Text("Loading"),
      //     //   );
      //     // }
      //   },
      // ),
    );
  }
}