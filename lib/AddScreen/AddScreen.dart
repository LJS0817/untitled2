import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/AddScreen/CustomIconButton.dart';
import 'package:untitled2/AddScreen/CustomTextField.dart';
import 'package:untitled2/AddScreen/DismissBackgroundContainer.dart';
import 'package:untitled2/MainScreen/DataCard.dart';
import 'package:untitled2/MenuScreen/CustomNavigationBar.dart';
import 'package:untitled2/Mng/DataMng.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {

  late Key _key;
  AddScreen({super.key}) {
    _key = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    //DataMng dataMng = Provider.of<DataMng>(context);

    return StartWidget(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            log("OUT");
          },
          child: Container(
            height: double.maxFinite,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text(
                  "미리 보기",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                // Dismissible(
                //   key: _key,
                //   movementDuration: const Duration(milliseconds: 400),
                //   resizeDuration: const Duration(milliseconds: 700),
                //   background: DismissBackgroundContainer(ThemeColor.MainColor, Colors.white, "삭제하기", "assets/icons/delete.svg"),
                //   secondaryBackground: DismissBackgroundContainer(Colors.white, ThemeColor.MainColor, "추가하기", "assets/icons/add.svg"),
                //   dismissThresholds: const { DismissDirection.startToEnd : 0.7, DismissDirection.endToStart : 0.7 },
                //   onDismissed: (DismissDirection dir) {
                //     if(dir.index == 2) {  //right
                //       // appMng.addData(dataMng.getData());
                //       Navigator.of(context)..pop()..pop();
                //     } else if(dir.index == 3) { //left
                //       Navigator.of(context).pop();
                //     }
                //   },
                //   child: DataCard.WithDataFrame(d: dataMng.getData()),
                // ),
                Text(
                  "<  추가              스와이프              삭제  >",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: ThemeColor.MainColor.withOpacity(0.5),
                    height: 2,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 20)),
                const Text(
                  "아이콘",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                // Container(
                //   height: 190,
                //   padding: const EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: GridView.builder(
                //     primary: false,
                //     itemCount: IconPath.getLength(),
                //     padding: const EdgeInsets.symmetric(horizontal: 5),
                //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //       crossAxisCount: 6,
                //       crossAxisSpacing: 7,
                //       mainAxisSpacing: 7,
                //     ),
                //     itemBuilder: (context, i) {
                //       return CustomIconButton(i == dataMng.getData().getIconIndex(), IconPath.getPathUsingInt(i), i);
                //     },
                //   ),
                // ),
                const Padding(padding: EdgeInsets.only(top: 10)),
                CustomTextField("타이틀"),
                CustomTextField("서브타이틀"),
                CustomTextField("가격"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
