import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/DataCard.dart';
import 'package:untitled2/Mng/IconPath.dart';
import 'package:untitled2/Mng/InfoMng.dart';

class UsageListView extends StatelessWidget {

  const UsageListView({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.read<InfoMng>().getCurrentData().list);
    return Positioned(
      top: 75,
      left: 10,
      right: 10,
      bottom: 10,
      child: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView.builder(
          itemCount: context.watch<InfoMng>().getCurrentData().list.length,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return DataCard(context.watch<InfoMng>().getCurrentData().list[index]);
            // return DataCard.init(
            //   title: "타이틀",
            //   sub: "서브타이틀",
            //   cost: -1000 * index,
            //   path: IconPath.getPath(ICON.E_APP),
            //   iconIdx: 0,
            // );
          },
        ),
      ),
    );
  }
}
