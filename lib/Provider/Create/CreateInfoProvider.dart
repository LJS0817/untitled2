
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/InfoMng.dart';

class CreateInfoProvider extends ChangeNotifier {
  InfoDataframe _data = InfoDataframe();
  int index = -1;

  void setInfo(String key, String value) {
    switch(key) {
      case "name" :
        _data.setName(value);
        break;
      case 'current' :
        _data.setMoney(int.parse(value));
        break;
      case 'budget' :
        _data.setMax(int.parse(value));
        break;
      case 'resetDate' :
        _data.setResetDate(value);
        break;
      default:
        break;
    }
    notifyListeners();
  }

  String getInfo(String key) {
    switch(key) {
      case "id" :
        return _data.getId().toString();
      case "name" :
        return _data.getName();
      case 'current' :
        return _data.getMoney().toString();
      case 'budget' :
        return _data.getMax().toString();
      case 'resetDate' :
        return _data.getResetDate();
      default:
        return "FAILED";
    }
  }

  void saveData(BuildContext context) {
    context.read<InfoMng>().addInfoData(context, _data);
  }

  void updateData(BuildContext context) {
    context.read<InfoMng>().updateInfoData(context, _data, index);
  }

  void setData(InfoDataframe d, int idx) {
    _data = d.clone();
    index = idx;
  }

  void clear() {
    index = -1;
    _data = InfoDataframe();
  }

  @override
  String toString() {
    return _data.toMap().toString();
  }
}