import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/MainScreen/Usage/UsageListView.dart';
import 'package:untitled2/MainScreen/Usage/BackgroundWidget.dart';
import 'package:untitled2/MainScreen/Usage/CircleButton.dart';
import 'package:untitled2/Mng/InfoMng.dart';

class SpendList extends StatelessWidget {
  const SpendList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            const BackgroundWidget(),
            context.read<InfoMng>().outOfIndex() ? Container() : const CircleButton(),
            context.read<InfoMng>().outOfIndex() ? Center(child: Text("새로 추가하여 지출을 기록하세요."),) : UsageListView(),
          ],
        ),
      ),
    );
  }
}
