import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../Dataframes/CustomDataframe.dart';
import 'DatabaseMng.dart';

class CustomMng extends ChangeNotifier {
  List<CustomDataframe> _set = [];
  bool _started = false;

  void insertCustom(BuildContext cxt, CustomDataframe data) async {
    await cxt.read<DatabaseMng>().insertCustom(data);
    if(_set.length > 1) data.setId(_set[_set.length - 1].getId() + 1);
    _set.add(data);
    notifyListeners();
  }

  void updateCustom(BuildContext cxt, CustomDataframe data) async {
    await cxt.read<DatabaseMng>().updateCustom(data);
    notifyListeners();
  }

  void deleteCustom(BuildContext cxt, int id) async {
    await cxt.read<DatabaseMng>().deleteCustom(id);
    notifyListeners();
  }

  Future<bool> loadData(BuildContext context) async {
    if(_started) return true;

    DatabaseMng db = context.read<DatabaseMng>();
    List<Map<String, Object?>> data = await db.getCustom();
    // print(data);
    for(int i = 0; i < data.length; i++) {
      _set.add(CustomDataframe.init(data[i]));
    }

    _started = true;
    return true;
  }

  CustomDataframe getData(int idx) {
    return _set[idx];
  }

  int getLength() { return _set.length; }
  List<CustomDataframe> getList() { return _set; }
}