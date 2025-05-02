import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';
import 'package:untitled2/Provider/Create/CreateUsageProvider.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:provider/provider.dart';

import '../Utils/ConvertValue.dart';

class DataCard extends StatefulWidget {
  DataCard(Map<String, Object?> map, int idx) { data = DataFrame.init(map); index = idx; }

  late DataFrame data;
  int index = 0;
  bool showMenu = false;
  bool isDeleted = false;

  @override
  State<DataCard> createState() => _DataCardState();
}

class _DataCardState extends State<DataCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 80,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: AnimatedContainer(
              duration: 90.ms,
              curve: Curves.fastOutSlowIn,
              width: widget.showMenu ? 50 : 0,
              decoration: const BoxDecoration(
                color: ThemeColor.MainColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.white.withOpacity(0.4),
                  highlightColor: ThemeColor.BackgroundColor.withOpacity(0.4),
                  onTap: () {
                    log("message");
                    setState(() {
                      widget.data.setRemoved(1);
                      Provider.of<InfoMng>(context, listen: false).deleteUsage(context, widget.data, widget.index);
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 6),
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(
                      IconPath.getPath(ICON.E_MENU_DELETE),
                      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  )
                ),
              ),
            ),
          ),
          Positioned(
            child: AnimatedContainer(
              duration: 90.ms,
              width: double.maxFinite,
              margin: EdgeInsets.only(right: widget.showMenu ? 40 : 0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                                  IconPath.getPathUsingInt(widget.data.getIconIndex()),
                                  color: widget.data.isNormal() ? ThemeColor.MainColor : widget.data.isRefund() ? ThemeColor.MainGreenColor : ThemeColor.MainGrayColor,
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
                                  widget.data.getTitle() + (widget.data.isCanceled() ? " ( 취소 )" : ""),
                                  overflow: TextOverflow.fade,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  widget.data.getDetail(),
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
                                ConvertValue.costToString(widget.data.getCost()),
                                style: TextStyle(
                                  color: widget.data.isNormal() ? ThemeColor.MainColor : widget.data.isRefund() ? ThemeColor.MainGreenColor : ThemeColor.MainGrayColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                "잔액. ${ConvertValue.costToString(widget.data.getRemain())}",
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
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      splashColor: ThemeColor.MainColor.withOpacity(0.6),
                      highlightColor: ThemeColor.MainColor.withOpacity(0.6),
                      onTap: () {
                        setState(() {
                          widget.showMenu = !widget.showMenu;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.isDeleted || !widget.data.isNormal(),
            child: Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Material(
                color: widget.data.isCanceled() ? ThemeColor.MainGrayColor.withOpacity(0.4) : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(splashColor : Colors.transparent, highlightColor: Colors.transparent, onTap: () { }, ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}