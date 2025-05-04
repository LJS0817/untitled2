import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:untitled2/AddScreen/CustomIconButton.dart';
import 'package:untitled2/AddScreen/CustomTextField.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';
import 'package:untitled2/MenuScreen/CustomNavigationBar.dart';
import 'package:untitled2/Mng/CustomMng.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/StartWidget.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Utils/ArgumentConvert.dart';

import '../Mng/InfoMng.dart';

class AddScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    CreateUsageProvider data = Provider.of<CreateUsageProvider>(context);
    final flag = ModalRoute.of(context)!.settings.arguments as ArgumentConvert;
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
            child: Column(
              children: [
                Expanded(
                  child: ScrollConfiguration(
                    behavior: const ScrollBehavior().copyWith(overscroll: false),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          flag.flag == "usage" ? "사용내역 추가" : "고정지출 추가",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        // const Text(
                        //   "미리 보기",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 18,
                        //   ),
                        // ),
                        // Dismissible(
                        //   key: UniqueKey(),
                        //   movementDuration: const Duration(milliseconds: 400),
                        //   resizeDuration: const Duration(milliseconds: 700),
                        //   background: DismissBackgroundContainer(ThemeColor.MainColor, Colors.white, "삭제하기", IconPath.getPath(ICON.E_MENU_DELETE)),
                        //   secondaryBackground: DismissBackgroundContainer(Colors.white, ThemeColor.MainColor, "추가하기", IconPath.getPath(ICON.E_MENU_ADD)),
                        //   dismissThresholds: const { DismissDirection.startToEnd : 0.7, DismissDirection.endToStart : 0.7 },
                        //   onDismissed: (DismissDirection dir) async {
                        //     if(dir.index == 2) {  //right
                        //       await data.saveData(context);
                        //       if(context.mounted) Navigator.of(context)..pop()..pop();
                        //     } else if(dir.index == 3) { //left
                        //       data.clear(context.read<InfoMng>().getCurrentData().getId());
                        //       Navigator.of(context).pop();
                        //     }
                        //   },
                        //   child: PreviewCard(),
                        // ),
                        // Text(
                        //   "<  추가              스와이프              삭제  >",
                        //   textAlign: TextAlign.center,
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 12,
                        //     color: ThemeColor.MainColor.withOpacity(0.5),
                        //     height: 2,
                        //   ),
                        // ),
                        const Padding(padding: EdgeInsets.only(top: 20)),
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
                            itemCount: IconPath.getLength(),
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              crossAxisSpacing: 7,
                              mainAxisSpacing: 7,
                            ),
                            itemBuilder: (context, i) {
                              return CustomIconButton(i == int.parse(data.getData("iconIdx")), IconPath.getPathUsingInt(i), i);
                            },
                          ),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        CustomTextField("분류", "title"),
                        CustomTextField("세부사항", "detail"),
                        CustomTextField("가격", "cost"),
                      ],
                    ),
                  ),
                ),
                CustomNavigationBar(
                      () => {
                        FocusManager.instance.primaryFocus?.unfocus(),
                        data.clear(context.read<InfoMng>().getCurrentData().getId()),
                        Navigator.pop(context)
                      },
                      () => {
                        FocusManager.instance.primaryFocus?.unfocus(),

                        if(flag.flag == "usage") {
                          data.saveData(context), context.read<InfoMng>().useMoney(int.parse(data.getData('cost'))),
                          data.clear(context.read<InfoMng>().getCurrentData().getId()),
                          if(context.mounted) Navigator.of(context)..pop()..pop(),},
                        if(flag.flag == "custom") {
                          context.read<CustomMng>().insertCustom(context, CustomDataframe.init2(data.data.toMapWithoutId())),
                          Navigator.of(context).pop()},
                      },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
