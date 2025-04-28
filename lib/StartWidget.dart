import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/ThemeColor.dart';

import 'Mng/DatabaseMng.dart';

class StartWidget extends StatelessWidget {
  Widget widget = Placeholder();
  StartWidget({required Widget child,super.key}) {
    widget = child;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ThemeColor.BackgroundColor,
        appBar: AppBar(
          backgroundColor: ThemeColor.MainColor,
        ),
        body: widget,
      ),
    );
  }
}
