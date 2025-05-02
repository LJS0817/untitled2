import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

import '../Dataframes/InfoDataframe.dart';

class InfoMng with ChangeNotifier {
  List<InfoDataframe> _info = [];
  int _curIndex = 0;
  bool _started = false;

  InfoMng() {
    // _maxMoney = db.getMaxMoney();
    // _money = db.getCurMoney();
    // loadData(db);
  }

  void insertUsageData(DataFrame data) {
    getCurrentData().addList(data.toMap());
    // log("LIST    _    " + getCurrentData().list.toString());
    notifyListeners();
  }

  void deleteUsage(BuildContext context, DataFrame data, int idx) async {
    getCurrentData().deleteList(idx, data);
    // log("TEST          " + data.toMap().toString());
    DataFrame d = await context.read<DatabaseMng>().deleteUsage(data, getCurrentData().getId(), getCurrentData().getMoney(), ConvertValue.toInt(readCurrentData()[readCurrentData().length - 1]['id']) + 1);
    getCurrentData().addList(d.toMap());
    getCurrentData().useMoney(data.getCost() * -1);
    notifyListeners();
  }

  void addInfoData(BuildContext cxt, InfoDataframe info) async {
    _info.add(info);
    await cxt.read<DatabaseMng>().insertCard(info);
    notifyListeners();
  }

  Future<bool> loadData(BuildContext cxt) async {
    if(_started) return true;
    DatabaseMng db = cxt.read<DatabaseMng>();
    List<Map<String, Object?>> data = await db.getInfo();
    // print(data);
    for(int i = 0; i < data.length; i++) {
      _info.add(InfoDataframe.init(data[i]));
      _info[i].list = List.from(await db.getList(_info[i].getId()));
    }
    _started = true;
    return true;
  }

  bool existData() { return _info.length > 0; }

  InfoDataframe getCurrentData() {
    return _info[_curIndex];
  }

  List<Map<String, Object?>> readCurrentData() {
    return getCurrentData().getList();
  }

  void changeState() {
    notifyListeners();
  }
}