import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/CreateCard/CreateCard.dart';
import 'package:untitled2/MainScreen/SpendList.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/MainScreen/TitleCard.dart';

import '../Mng/AppMng.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppMng appMng = Provider.of<AppMng>(context, listen: false);
    return StartWidget(
      child: FutureBuilder(
        future: appMng.init(),
        builder: (cxt, snap) {
          if(snap.hasData) {
            if(snap.data == true) {
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
          } else {
            return Container(
              child: Text("Loading"),
            );
          }
        },
      ),
    );
  }
}