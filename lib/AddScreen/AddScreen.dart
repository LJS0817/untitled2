import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/AddScreen/CustomIconButton.dart';
import 'package:untitled2/AddScreen/CustomTextField.dart';
import 'package:untitled2/MenuScreen/CustomNavigationBar.dart';
import 'package:untitled2/Mng/DataMng.dart';
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
    DataMng dataMng = Provider.of<DataMng>(context);

    return StartWidget(
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: Dismissible(
          key: _key,
          movementDuration: const Duration(milliseconds: 400),
          resizeDuration: const Duration(milliseconds: 500),
          background: Container(
            color: ThemeColor.MainColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  child: SvgPicture.asset(
                    "assets/icons/delete.svg",
                    color: Colors.white,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text(
                  "Deleted",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  child: SvgPicture.asset(
                    "assets/icons/save.svg",
                    color: ThemeColor.MainColor,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(10)),
                const Text(
                  "Saved",
                  style: TextStyle(
                    color: ThemeColor.MainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
          ),
          onDismissed: (DismissDirection dir) {
            if(dir.index == 2) {  //right
              Navigator.of(context)..pop()..pop();
            } else if(dir.index == 3) { //left
              Navigator.of(context).pop();
            }
          },
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
                    "아이콘",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                    height: 190,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: GridView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: 10,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 7,
                        mainAxisSpacing: 7,
                      ),
                      itemBuilder: (context, i) {
                        return CustomIconButton(i == dataMng.getData().getIconIndex(), "assets/icons/list.svg", i);
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  CustomTextField("타이틀"),
                  CustomTextField("서브타이틀"),
                  CustomTextField("가격"),
                ],
              ),
            ),
          ),
        )
      ),
    );
  }
}
