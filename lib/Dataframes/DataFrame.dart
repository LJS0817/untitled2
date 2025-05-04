import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';
import 'package:untitled2/Utils/ConvertValue.dart';
import 'package:untitled2/Utils/DateViewer.dart';

class DataFrame with ChangeNotifier {
  int _id = 1;
  String _date = "";
  int _cardID = 0;

  String _title = "";
  String _detail = "";
  int _cost = 0;
  int _remain = 0;
  int _iconIndex = 1;
  int _removed = 0;

  DataFrame() {
    _date = "";
    _cardID = 0;

    _title = "";
    _detail = "";
    _cost = 0;
    _remain = 0;
    _iconIndex = 1;
    _removed = 0;
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

  DataFrame.convert(CustomDataframe data, int cId, int re) {
    _date = DateViewer.getDate();
    _title = data.getTitle();
    _detail = data.getDetail();
    _cost = data.getCost();
    _remain = re;
    _iconIndex = data.getIconIdx();
    _removed = 0;
  }

  String getTitle() { return _title; }
  String getDetail() { return _detail; }
  int getCost() { return _cost; }
  int getRemain() { return _remain; }
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