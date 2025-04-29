import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';

class InfoMng with ChangeNotifier {
  int _money = 0;
  int _maxMoney = 0;

  InfoMng(BuildContext cxt, {int max=0, int cur=0}) {
    DatabaseMng db = cxt.read<DatabaseMng>();
    // _maxMoney = db.getMaxMoney();
    // _money = db.getCurMoney();
    db.getInfo(1);
  }

  void setMoney(int m) { _money = m; }
  int getMoney() { return _money; }

  void setMax(int m) { _maxMoney = m; }
  int getMax() { return _maxMoney; }

  String costToString(int m) {
    if(m < 0) {
      return '-${NumberFormat('###,###').format(m * -1)}';
    }
    return NumberFormat('###,###').format(m);
  }

  String maxToString() {
    return costToString(getMax());
  }

  String moneyToString() {
    return costToString(getMoney());
  }

  void changeState() {
    notifyListeners();
  }
}