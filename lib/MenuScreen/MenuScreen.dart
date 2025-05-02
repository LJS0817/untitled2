import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MenuScreen/BottomButton.dart';
import 'package:untitled2/MenuScreen/CustomNavigationBar.dart';
import 'package:untitled2/MenuScreen/NewSpendItemBox.dart';
import 'package:untitled2/MenuScreen/SpendItemBox.dart';
import 'package:untitled2/Mng/CustomMng.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:untitled2/ThemeColor.dart';

import '../Provider/Create/CreateUsageProvider.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomMng custom = context.watch<CustomMng>();
    return StartWidget(
      child: FutureBuilder(
        future: custom.loadData(context),
        builder: (cxt, snap) {
          return Container(
            width: double.infinity,
            color: ThemeColor.BackgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "사용 내역 추가",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: const Text(
                    "저장한 지출 내역",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: custom.getLength() + 1,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 135,
                      ),
                      itemBuilder: (context, i) {
                        if(i < custom.getLength()) {
                          return SpendItemBox(custom.getData(i), i);
                        } else {
                          return NewSpendItemBox();
                        }
                      },
                    ),
                  ),
                ),
                CustomNavigationBar(
                      () => { Navigator.pop(context) },
                      () => { Navigator.pushNamed(context, "/menu/add", arguments: {"flag" : "usage"}), context.read<CreateUsageProvider>().clear(context.read<InfoMng>().getCurrentData().getId()) },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
