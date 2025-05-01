import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';

import '../Dataframes/InfoDataframe.dart';

class InfoMng with ChangeNotifier {
  List<InfoDataframe> _info = [];
  int _curIndex = 0;

  InfoMng() {
    // _maxMoney = db.getMaxMoney();
    // _money = db.getCurMoney();
    // loadData(db);
  }

  Future<void> addInfoData(BuildContext cxt) async {

  }

  Future<InfoDataframe> loadData(BuildContext cxt) async {
    DatabaseMng db = cxt.read<DatabaseMng>();
    List<Map<String, Object?>> data = await db.getInfo();
    print(data);
    for(int i = 0; i < data.length; i++) {
      _info.add(InfoDataframe.init(data[i]));
      _info[i].list = await db.getList(_info[i].getId());
    }
    print(_info);
    print(getCurrentData());
    return getCurrentData();
  }

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