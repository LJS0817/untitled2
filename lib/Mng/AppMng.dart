import 'dart:developer';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled2/Mng/DataFrame.dart';

class AppMng extends ChangeNotifier {
  List<DataFrame> data = [];
  late SharedPreferences sh;
  bool hasChanged = true;
  Map<String, Map<String, String>> info = {
  };
  static const Map<String, Map<String, String>> form = {
    "default" : {
      "CardName" : "누구 카드",
      "Money" : "0",
      "MaxMoney" : "0"
    },
    "c" : {

    }
  };

  Future<bool> init() async {
    // if(hasChanged) {
    //   sh = await SharedPreferences.getInstance();
    //   if(sh.getString('info') == null) {
    //     info["c"] = {};
    //     return false;
    //   } else {
    //     // sh.remove('info');
    //     String str = sh.getString('info').toString();
    //     log(str);
    //     Map m = json.decode(str);
    //     for(String k in m.keys) {
    //       log(k.toString());
    //       // info[k] = m[k];
    //     }
    //
    //     // info = m.cast();
    //     // log(info.toString());
    //     // info = json.decode(sh.getString('info').toString());
    //     // log("SADSA" + info.toString());
    //     // List<String> str = sh.getString('info').toString().split(", ");
    //     // for(int i = 0; i < str.length; i++) {
    //     //   if(i == 0 || i == str.length - 1) {
    //     //     str[i] = str[i].replaceAll(i == 0 ? '[' : ']', '');
    //     //   }
    //     //   List<String> item = str[i].split('=+=');
    //     //   data.add(DataFrame.init(item[0], item[1], int.parse(item[2]), item[3], int.parse(item[4])));
    //     // }
    //   }
    //   hasChanged = false;
    // }
    return true;
  }

  void setInfo(String id, String d, {String key="c"}) {
    if(d.isEmpty) return;
    if(info[key] == null) info[key] = {};
    if(id == "카드명") {
      info[key]?["CardName"] = d;
    } else if(id == "잔고") {
      info[key]?["Money"] = d;
    } else if(id == "예산") {
      info[key]?["MaxMoney"] = d;
    } else {
      info[key]?["ResetDay"] = d;
    }
    // log(info.toString());
    notifyListeners();
  }

  String? getInfo(String id, {String key="c"}) {
    return info[key]?[id] ?? form["default"]?[id];
  }

  void sendInfoData(DateTime dt) {
    if(info['c']!["MaxMoney"] == null || info['c']!["MaxMoney"] == '' ||  info['c']!["MaxMoney"] == '0') {
      info['c']!["MaxMoney"] = form['default']!['MaxMoney']!;
    } if(info['c']!["Money"] == null || info['c']!["Money"] == '' ||  info['c']!["Money"] == '0') {
      info['c']!["Money"] = form['default']!['Money']!;
    } if(info['c']!["CardName"] == null || info['c']!["CardName"] == '' ||  info['c']!["CardName"] == '0') {
      info['c']!["CardName"] = form['default']!['CardName']!;
    }
    info[dt.toString()] = info['c']!;
    info.remove('c');
    sh.setString("info", json.encode(info));
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