import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/CustomMng.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/Provider/Create/CreateCustomProvider.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

import '../Utils/ArgumentConvert.dart';
import '../Utils/ConvertValue.dart';

class SpendItemBox extends StatefulWidget {
  SpendItemBox(CustomDataframe frame, int idx, {super.key}) {
    index = idx;
    data = frame;
  }

  int index = 0;
  bool showMenu = false;
  late CustomDataframe data;

  final double radius = 20;

  Widget SpendItemLongTapButton(ICON iName, Function callback) {
    return Expanded(
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white.withOpacity(0.6),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(13),
            highlightColor: Colors.white,
            onTap: () {
              callback();
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                IconPath.getPath(iName),
                color: ThemeColor.MainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<SpendItemBox> createState() => _SpendItemBoxState();
}

class _SpendItemBoxState extends State<SpendItemBox> {
  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.showMenu ? ThemeColor.MainColor : Colors.white,
      ),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: Stack(
              children: [
                Positioned(
                  top: 5,
                  child: Text(
                    widget.data.getTitle(),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: widget.showMenu ? Colors.white : Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  child: Text(
                    widget.data.getDetail(),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: widget.showMenu ? Colors.white.withOpacity(0.55) : ThemeColor.TextColorGrey,
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      width: 40,
                      height: 40,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: ThemeColor.MainColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: SvgPicture.asset(
                        IconPath.getPathUsingInt(widget.data.getIconIdx()),
                        color: ThemeColor.MainColor,
                      ),
                    )
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Text(
                    ConvertValue.costToString(widget.data.getCost()),
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: widget.showMenu ? Colors.transparent : ThemeColor.MainColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(widget.radius),
                highlightColor: ThemeColor.MainColor.withOpacity(0.3),
                splashColor: ThemeColor.MainColor.withOpacity(0.2),
                onTap: () async {
                  if(widget.showMenu) {
                    setState(() {
                      widget.showMenu = false;
                    });
                  } else {
                    await info.insertUsageData(context, DataFrame.convert(widget.data, info.getCurrentData().getId(), info.getCurrentData().useMoney(widget.data.getCost())));
                    Navigator.of(context).pop();
                  }
                },
                onLongPress: () {
                  setState(() {
                    widget.showMenu = true;
                    info.changeState();
                  });
                },
              ),
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: 10,
            child: Visibility(
              visible: widget.showMenu,
              child: Row(
                children: [
                  widget.SpendItemLongTapButton(ICON.E_MENU_EDIT, () {
                    log(widget.data.toMap().toString());
                    context.read<CreateUsageProvider>().data = DataFrame.convert(widget.data, info.getCurrentData().getId(), info.getCurrentData().getMoney());
                    Navigator.pushNamed(context, "/menu/add", arguments: ArgumentConvert("custom_${widget.index}"));
                  }),
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                  widget.SpendItemLongTapButton(ICON.E_MENU_DELETE, () {
                    context.read<CustomMng>().deleteCustom(context, widget.data.getId(), widget.index);
                  }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}