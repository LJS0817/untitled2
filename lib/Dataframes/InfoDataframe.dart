import 'package:intl/intl.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Utils/ConvertValue.dart';

class InfoDataframe {
  String _name = "";
  int _money = 0;
  int _maxMoney = 0;
  int _id = -1;
  bool _pin = false;
  String _resetDate = "000";

  List<Map<String, Object?>> list = [];

  final int _listOffset = 10;

  int _curOffset = 0;

  InfoDataframe() {

  }

  InfoDataframe.init(Map<String,Object?> data) {
    _name = data['name'].toString();
    _money = int.parse(data['current'].toString());
    _maxMoney = int.parse(data['budget'].toString());
    _id = int.parse(data['id'].toString());
    _pin = data['pin'].toString().contains("0");
    _resetDate = data['resetDate'].toString();
    _curOffset = _listOffset;
  }

  int useMoney(int m) {
    _money -= m;
    return _money;
  }

  void setMoney(int m) { _money = m; }
  int getMoney() { return _money; }

  void setMax(int m) { _maxMoney = m; }
  int getMax() { return _maxMoney; }

  int getId() { return _id; }

  void setName(String str) { _name = str; }
  String getName() { return _name; }

  void setPin(bool p) { _pin = p; }

  void setResetDate(String str) { _resetDate = str; }
  String getResetDate() { return _resetDate; }

  List<Map<String, Object?>> getList() { return list; }
  void addList(Map<String, Object> map) { list.add(map); }
  void deleteList(int idx, DataFrame data) { list[idx] = data.toMap(); }

  String maxToString() {
    return ConvertValue.costToString(getMax());
  }

  String moneyToString() {
    return ConvertValue.costToString(getMoney());
  }

  Map<String, Object> toMap() {
    return {
      'id' : _id,
      'name' : _name,
      'current' : _money,
      'budget' : _maxMoney,
      'pin' : _pin,
      'resetDate' : _resetDate,
    };
  }

  Map<String, Object> toMapWithoutId() {
    return {
      'name' : _name,
      'current' : _money,
      'budget' : _maxMoney,
      'pin' : _pin ? "0" : "NULL",
      'resetDate' : _resetDate,
    };
  }
}