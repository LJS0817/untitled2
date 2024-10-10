import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Mng/DataFrame.dart';

class AppMng extends ChangeNotifier {
  // List<DataFrame> data = [DataFrame.init("test", "sug", 100, "assets/icons/menu/list.svg", 0), DataFrame.init("123", "dsaf", 100, "assets/icons/menu/list.svg", 0)];
  List<DataFrame> data = [];
  late SharedPreferences sh;

  Future<bool> init() async {
    sh = await SharedPreferences.getInstance();
    List<String> str = sh.getString('test').toString().split(", ");
    for(int i = 0; i < str.length; i++) {
      if(i == 0 || i == str.length - 1) {
        str[i] = str[i].replaceAll(i == 0 ? '[' : ']', '');
      }
      List<String> item = str[i].split('=+=');
      data[i].init(item[0], item[1], int.parse(item[2]), item[3], int.parse(item[4]));
    }

    return true;
  }

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