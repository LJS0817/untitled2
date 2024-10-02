import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Mng/DataFrame.dart';

class AppMng extends ChangeNotifier {
  List<DataFrame> data = [];

  List<DataFrame> getData() {
    return data;
  }

  DataFrame getDataFrame(int idx) {
    return data[idx];
  }

  int getSize() {
    return data.length;
  }

  void addData(DataFrame d) {
    data.add(d);
    ChangeNotifier();
  }

  void updateData(DataFrame d, int idx) {
    data[idx] = d;
    ChangeNotifier();
  }

  void deleteData(int index) {
    data.removeAt(index);
    ChangeNotifier();
  }
}