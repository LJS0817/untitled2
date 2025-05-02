import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class DataFrame with ChangeNotifier {
  int _id = 1;
  String _date = "";
  int _cardID = 0;

  String _title = "";
  String _detail = "";
  int _cost = 0;
  int _remain = 0;
  String _iconPath = "";
  int _iconIndex = 0;
  int _removed = 0;

  DataFrame() {

  }

  DataFrame.init(Map<String, Object?> data) {
    _id = ConvertValue.toInt(data["id"]);
    _date = data["date"].toString();
    _cardID = ConvertValue.toInt(data["cardID"]);
    _title = data["title"].toString();
    _detail = data["detail"].toString();
    _cost = ConvertValue.toInt(data["cost"]);
    _remain = ConvertValue.toInt(data["remain"]);
    _iconIndex = ConvertValue.toInt(data['iconIdx']);
    _removed = ConvertValue.toInt(data['removed']);
  }

  String getTitle() { return _title; }
  String getDetail() { return _detail; }
  int getCost() { return _cost; }
  int getRemain() { return _remain; }
  String getIconPath() { return _iconPath; }
  int getIconIndex() { return _iconIndex; }
  int getId() { return _id; }
  int getRemoved() { return _removed; }

  bool isRefund() { return _removed == 2; }
  bool isCanceled() { return _removed == 1; }
  bool isNormal() { return _removed == 0; }

  void setId(int i) { _id = i; }
  void setTitle(String str) { _title = str; }
  void setDetail(String str) { _detail = str; }
  void setCost(int i) { _cost = i; }
  void setRemain(int i) { _remain = i; }
  void setIconPath(String str) { _iconPath = str; }
  void setIconIndex(int i) { _iconIndex = i; }
  void setDate(String str) { _date = str; }
  void setCardID(int i) { _cardID = i; }
  void setRemoved(int i) { _removed = i; }

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
      'removed' : _removed
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
      'removed' : _removed
    };
  }
}