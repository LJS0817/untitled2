
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/InfoMng.dart';

class CreateInfoProvider extends ChangeNotifier {
  InfoDataframe _data = InfoDataframe();

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
    InfoMng mng = context.read<InfoMng>();
    mng.addInfoData(context, _data);
  }

  @override
  String toString() {
    return _data.toMap().toString();
  }
}