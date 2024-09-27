import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class InfoMng with ChangeNotifier {
  int _money = 0;
  int _maxMoney = 0;

  InfoMng({int max=0, int cur=0}) {
    _maxMoney = max;
    _money = cur;
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