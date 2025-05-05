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

  int getCurrentIndex() {
    return _curIndex;
  }

  void changeCurrentIndex(int n) {
    _curIndex += n;
    if(_curIndex < 0) {
      _curIndex = getSize();
    } else if(getSize() < _curIndex) {
      _curIndex = 0;
    }
    notifyListeners();
  }

  void setIndex(int n) {
    _curIndex = n;
    notifyListeners();
  }

  void useMoney(int m) {
    getCurrentData().useMoney(m);
  }

  Future<void> insertUsageData(BuildContext context, DataFrame data) async {
    if(data.getId() == -1) data.setId(1);
    getCurrentData().addList(data.toMap());
    await context.read<DatabaseMng>().insertUsage(data);
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

  void deleteInfo(BuildContext context) async {
    await context.read<DatabaseMng>().deleteInfo(getCurrentData().getId());
    _info.removeAt(_curIndex);
    _curIndex = 0;
    notifyListeners();
  }

  Future<void> updateInfoData(BuildContext cxt, InfoDataframe info, int idx) async {
    _info[idx] = info;
    await cxt.read<DatabaseMng>().updateCard(info.toMapWithoutId(), info.getId());
    setIndex(idx);
    notifyListeners();
  }

  void addInfoData(BuildContext cxt, InfoDataframe info) async {
    info.setId(existData() ? _info[getSize() - 1].getId() + 1 : 1);
    _info.add(info);
    _curIndex = getSize() - 1;
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

  bool existData() { return _info.isNotEmpty; }

  InfoDataframe getCurrentData() {
    return _info[_curIndex];
  }

  int getSize() { return _info.length; }

  bool outOfIndex() { return _info.length - 1 < _curIndex; }

  List<Map<String, Object?>> readCurrentData() {
    return getCurrentData().getList();
  }

  void changeState() {
    notifyListeners();
  }
}