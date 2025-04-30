import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';

import '../Dataframes//InfoDataframe.dart';

class InfoMng with ChangeNotifier {
  List<InfoDataframe> _info = [];
  int _curIndex = 0;

  InfoMng(BuildContext cxt, {int max=0, int cur=0}) {
    DatabaseMng db = cxt.read<DatabaseMng>();
    // _maxMoney = db.getMaxMoney();
    // _money = db.getCurMoney();
    loadData(db);
  }

  void loadData(DatabaseMng db) async {
    List<Map<String, Object?>> data = await db.getInfo();
    print(data);
    for(int i = 0; i < data.length; i++) {
      _info.add(InfoDataframe(data[i]));
    }
  }

  InfoDataframe getCurrentData() {
    return _info[_curIndex];
  }

  Map<String, Object?> readCurrentData() {
    return getCurrentData().getList();
  }

  void changeState() {
    notifyListeners();
  }
}