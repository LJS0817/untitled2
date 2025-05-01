import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/CreateCard/CreateTextField.dart';
import 'package:untitled2/MainScreen/CreateCard/ResetTimePicker.dart';
import 'package:untitled2/MainScreen/CreateCard/SimpleCard.dart';
import 'package:untitled2/MainScreen/TitleCard.dart';
import 'package:untitled2/ThemeColor.dart';

import '../../Provider/Create/CreateInfoProvider.dart';

class CreateCard extends StatelessWidget {
  CreateCard({super.key});

  String _resetForm = "000";

  @override
  Widget build(BuildContext context) {
    log("message");
    CreateInfoProvider infoProvider = Provider.of<CreateInfoProvider>(context);
    _resetForm = infoProvider.getInfo("resetDate");
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView(
        shrinkWrap: true,
        children: [
          SimpleCard(),
          ResetTimePicker(_resetForm, (int idx, int val) => {
            if(idx == 0) {
              _resetForm = val.toString() + _resetForm[1] + _resetForm[2]
              // _resetForm = val;
            } else if(val > 9) {
              _resetForm = _resetForm[0] + val.toString()
            } else {
              _resetForm = _resetForm[0] + '0' + val.toString()
            }
          }),
          const Padding(padding: EdgeInsets.all(10)),
          CreateTextField(title: "카드명", sKey: "name",),
          const Padding(padding: EdgeInsets.all(10)),
          CreateTextField(title: "예산", sKey: "budget", isNumber: true,),
          const Padding(padding: EdgeInsets.all(10)),
          CreateTextField(title: "잔고", sKey: "current",isNumber: true,),
          const Padding(padding: EdgeInsets.all(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 25),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: ThemeColor.MainColor, width: 3, strokeAlign: BorderSide.strokeAlignOutside),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    highlightColor: ThemeColor.MainColor.withOpacity(0.4),
                    splashColor: ThemeColor.MainColor.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      infoProvider.setInfo("current", infoProvider.getInfo("budget"));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: const Text(
                        "아직 돈을 사용하지 않음",
                        style: TextStyle(
                          color: ThemeColor.MainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 25),
                alignment: Alignment.bottomRight,
                child: Material(
                  color: ThemeColor.MainColor,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    highlightColor: Colors.white.withOpacity(0.4),
                    splashColor: Colors.white.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      infoProvider.setInfo('resetDate', _resetForm);
                      log(infoProvider.toString());
                      infoProvider.saveData(context);
                      // infoProvider.setInfo("resetDate", );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                      child: const Text(
                        "추가하기",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
