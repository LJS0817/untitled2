import 'package:flutter/cupertino.dart';

class DataFrame with ChangeNotifier {
  String _title = "";
  String _subTitle = "";
  int _cost = 0;
  String _iconPath = "";
  int _iconIndex = 0;

  void init(String t, String s, int c, String i, int iconIdx) {
    _title = t;
    _subTitle = s;
    _cost = c;
    _iconPath = i;
    _iconIndex = iconIdx;
  }

  String getTitle() { return _title; }
  String getSubTitle() { return _subTitle; }
  int getCost() { return _cost; }
  String getIconPath() { return _iconPath; }
  int getIconIndex() { return _iconIndex; }

  void setTitle(String str) { _title = str; }
  void setSubTitle(String str) { _subTitle = str; }
  void setCost(int i) { _cost = i; }
  void setIconPath(String str) { _iconPath = str; }
  void setIconIndex(int i) { _iconIndex = i; }
}