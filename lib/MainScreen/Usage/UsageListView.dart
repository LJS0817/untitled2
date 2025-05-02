import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/DataCard.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';

class UsageListView extends StatelessWidget {

  const UsageListView({super.key});

  @override
  Widget build(BuildContext context) {
    InfoMng info = Provider.of<InfoMng>(context);
    return Positioned(
      top: 75,
      left: 10,
      right: 10,
      bottom: 10,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          itemCount: info.getCurrentData().list.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return DataCard(info.getCurrentData().list[info.getCurrentData().list.length - 1 - index], info.getCurrentData().list.length - 1 - index);
          },
        ),
      ),
    );
  }
}
