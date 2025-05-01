import 'dart:developer';

import 'package:flutter/cupertino.dart';

class DataFrame with ChangeNotifier {
  int _id = 0;
  String _date = "";
  int _cardID = 0;

  String _title = "";
  String _detail = "";
  int _cost = 0;
  int _remain = 0;
  String _iconPath = "";
  int _iconIndex = 0;

  DataFrame() {

  }

  DataFrame.init(Map<String, Object?> data) {
    log(data.toString());
    _id = int.parse(data["id"].toString());
    _date = data["date"].toString();
    _cardID = int.parse(data["cardID"].toString());
    _title = data["title"].toString();
    _detail = data["detail"].toString();
    _cost = int.parse(data["cost"].toString());
    _remain = int.parse(data["remain"].toString());
    _iconIndex = int.parse(data['iconIdx'].toString());
  }

  String getTitle() { return _title; }
  String getDetail() { return _detail; }
  int getCost() { return _cost; }
  int getRemain() { return _remain; }
  String getIconPath() { return _iconPath; }
  int getIconIndex() { return _iconIndex; }

  void setTitle(String str) { _title = str; }
  void setDetail(String str) { _detail = str; }
  void setCost(int i) { _cost = i; }
  void setRemain(int i) { _remain = i; }
  void setIconPath(String str) { _iconPath = str; }
  void setIconIndex(int i) { _iconIndex = i; }
  void setDate(String str) { _date = str; }
  void setCardID(int i) { _cardID = i; }

  Map<String, Object> toMap() {
    return {
      'id' : _id,
      'cardID' : _cardID,
      'date' : _date,
      'title' : _title,
      'detail' : _detail,
      'cost' : _cost,
      'remain' : _remain,
      'iconIdx' : _iconIndex,
    };
  }

  Map<String, Object> toMapWithoutId() {
    return {
      'cardID' : _cardID,
      'date' : _date,
      'title' : _title,
      'detail' : _detail,
      'cost' : _cost,
      'remain' : _remain,
      'iconIdx' : _iconIndex,
    };
  }
}