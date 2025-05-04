import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/ThemeColor.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

import '../Mng/InfoMng.dart';

import '../Mng/InfoMng.dart';
import 'Card/CardMenuIconButton.dart';

class TitleCard extends StatefulWidget {
  TitleCard({super.key});

  DateTime date = DateTime.now();
  bool showMenu = false;

  String getDate() {
    return "${date.month < 10 ? "0" : ""}${date.month}.${date.day < 10 ? "0" : ""}${date.day}";
  }

  @override
  State<TitleCard> createState() => _TitleCardState();
}

class _TitleCardState extends State<TitleCard> {
  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return Container(
      height: 110,
      decoration: BoxDecoration(
        color: ThemeColor.BackgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    info.getCurrentData().getName(),
                    style: const TextStyle(
                      color: ThemeColor.TextColorGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 5)),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ConvertValue.costToString(info.getCurrentData().getMoney()),
                          style: const TextStyle(
                            color: ThemeColor.MainColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "예산  ${ConvertValue.costToString(info.getCurrentData().getMax())}",
                          style: TextStyle(
                            color: ThemeColor.MainColor.withOpacity(0.4),
                            fontSize: 15,
                            height: 0.8,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                color: ThemeColor.MainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.centerLeft,
              child: Text(
                info.getCurrentData().getName(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ).animate(target: widget.showMenu ? 1 : 0).fade(begin: 0, end: 1, duration: 100.ms),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                  highlightColor: ThemeColor.MainColor.withOpacity(0.4),
                  splashColor: ThemeColor.MainColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    setState(() {
                      widget.showMenu = !widget.showMenu;
                    });
                  }
              ),
            ),
          ),
          Positioned(
            right: 10,
            top: 8,
            bottom: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CardMenuIconButton(ICON.E_MENU_EDIT, () {}),
                CardMenuIconButton(ICON.E_MENU_DELETE, () {}),
              ],
            ),
          ).animate(target: widget.showMenu ? 1 : 0).fade(begin: 0, end: 1, duration: 100.ms),
          // Container(
          //   width: 50,
          //   height: double.infinity,
          //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //   alignment: Alignment.center,
          //   decoration: BoxDecoration(
          //     color: ThemeColor.MainColor,
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: SizedBox(
          //     width: 25,
          //     height: 25,
          //     child: SvgPicture.asset(
          //       IconPath.getPath(ICON.E_MENU_EDIT),
          //       color: Colors.white,
          //     ),
          //   )
          // )
        ],
      ),
    );
  }
}


// class TitleCard extends StatelessWidget {
//
//   DateTime date = DateTime.now();
//   bool showMenu = false;
//
//   String getDate() {
//     return "${date.month < 10 ? "0" : ""}${date.month}.${date.day < 10 ? "0" : ""}${date.day}";
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     InfoMng info = Provider.of<InfoMng>(context);
//     return Container(
//       height: 110,
//         decoration: BoxDecoration(
//           color: ThemeColor.BackgroundColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//       margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//       child: Stack(
//         children: [
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             top: 0,
//             child: Container(
//               padding: const EdgeInsets.only(left: 15, top: 15),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     info.getCurrentData().getName(),
//                     style: const TextStyle(
//                       color: ThemeColor.TextColorGrey,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                   const Padding(padding: EdgeInsets.only(bottom: 5)),
//                   Container(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           ConvertValue.costToString(info.getCurrentData().getMoney()),
//                           style: const TextStyle(
//                             color: ThemeColor.MainColor,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         Text(
//                           "예산  ${ConvertValue.costToString(info.getCurrentData().getMax())}",
//                           style: TextStyle(
//                             color: ThemeColor.MainColor.withOpacity(0.4),
//                             fontSize: 15,
//                             height: 0.8,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             top: 0,
//             child: Material(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(10),
//               child: InkWell(
//                 highlightColor: ThemeColor.MainColor.withOpacity(0.4),
//                 splashColor: ThemeColor.MainColor.withOpacity(0.4),
//                   borderRadius: BorderRadius.circular(10),
//                 onTap: () {
//                   showMenu = !showMenu;
//                 }
//               ),
//             ),
//           ),
//           Positioned(
//             right: 10,
//             top: 8,
//             bottom: 8,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CardMenuIconButton(ICON.E_MENU_EDIT, () {}).animate(target: showMenu ? 1 : 0).fade(begin: 0, end: 1, duration: 150.ms),
//                 CardMenuIconButton(ICON.E_MENU_DELETE, () {}).animate(target: showMenu ? 1 : 0).fade(begin: 0, end: 1, duration: 150.ms),
//               ],
//             ),
//           ),
//           // Container(
//           //   width: 50,
//           //   height: double.infinity,
//           //   margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           //   alignment: Alignment.center,
//           //   decoration: BoxDecoration(
//           //     color: ThemeColor.MainColor,
//           //     borderRadius: BorderRadius.circular(10),
//           //   ),
//           //   child: SizedBox(
//           //     width: 25,
//           //     height: 25,
//           //     child: SvgPicture.asset(
//           //       IconPath.getPath(ICON.E_MENU_EDIT),
//           //       color: Colors.white,
//           //     ),
//           //   )
//           // )
//         ],
//       ),
//     );
//   }
// }
