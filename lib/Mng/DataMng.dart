import 'package:flutter/cupertino.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';

class DataMng with ChangeNotifier {
  DataFrame _curData = DataFrame();
  int _curIndex = -1;

  void setTitle(String str) {
    _curData.setTitle(str);
    notifyListeners();
  }
  void setSubTitle(String str) {
    _curData.setSubTitle(str);
    notifyListeners();
  }
  void setCost(int i) {
    _curData.setCost(i);
    notifyListeners();
  }
  void setIconPath(String str) {
    _curData.setIconPath(str);
    notifyListeners();
  }
  void setIconIndex(int i) {
    _curData.setIconIndex(i);
    notifyListeners();
  }
  void setIconData(String str, int i) {
    _curData.setIconPath(str);
    _curData.setIconIndex(i);
    notifyListeners();
  }

  void setData(DataFrame? data, int idx) {
    if(data == null) {
      _curData = DataFrame();
    } else {
      _curData = data;
    }
    _curIndex = idx;
  }

  DataFrame getData() {
    return _curData;
  }

  int getIndex() {
    return _curIndex;
  }
}