import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/DataCard.dart';
import 'package:untitled2/Mng/AppMng.dart';
import 'package:untitled2/Mng/IconPath.dart';

class UsageListView extends StatelessWidget {
  const UsageListView({super.key});

  @override
  Widget build(BuildContext context) {
    AppMng appMng = Provider.of<AppMng>(context, listen: false);
    return Positioned(
      top: 75,
      left: 10,
      right: 10,
      bottom: 10,
      child: FutureBuilder(
        future: appMng.init(),
        builder: (cxt, snap) {
          return ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(overscroll: false),
            child: ListView.builder(
              itemCount: appMng.getSize(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return DataCard.WithDataFrame(d: appMng.getDataFrame(index));
                // return DataCard(
                //     title: "타이틀",
                //     sub: "서브타이틀",
                //     cost: -1000 * index,
                //     path: IconPath.getPath(ICON.E_APP),
                //     iconIdx: 0,
                // );
              },
            ),
          );
        },
      )
    );
  }
}
