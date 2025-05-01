import 'package:flutter/cupertino.dart';

class DataFrame with ChangeNotifier {
  int _id = 0;
  String _date = "";
  int _cardID = 0;

  String _title = "";
  String _subTitle = "";
  int _cost = 0;
  int _remain = 0;
  String _iconPath = "";
  int _iconIndex = 0;

  DataFrame() {  }

  void init(Map<String, Object?> data) {
    _id = int.parse(data["id"].toString());
    _date = data["date"].toString();
    _cardID = int.parse(data["cardID"].toString());
    _title = data["title"].toString();
    _subTitle = data["sub"].toString();
    _cost = int.parse(data["price"].toString());
    _remain = int.parse(data["money"].toString());
    _iconIndex = int.parse(data['iconIdx'].toString());
  }

  String getTitle() { return (_title == "" ? "이름 없음" : _title); }
  String getSubTitle() { return (_subTitle == "" ? "설명 없음" : _subTitle); }
  int getCost() { return _cost; }
  int getRemain() { return _remain; }
  String getIconPath() { return _iconPath; }
  int getIconIndex() { return _iconIndex; }

  void setTitle(String str) { _title = str; }
  void setSubTitle(String str) { _subTitle = str; }
  void setCost(int i) { _cost = i; }
  void setIconPath(String str) { _iconPath = str; }
  void setIconIndex(int i) { _iconIndex = i; }

  @override
  String toString() {
    return "${_title}=+=${_subTitle}=+=${_cost}=+=${_iconPath}=+=${_iconIndex}";
  }
}