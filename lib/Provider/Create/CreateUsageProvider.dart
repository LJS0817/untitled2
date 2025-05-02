import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';

import '../../Mng/InfoMng.dart';

class CreateUsageProvider extends ChangeNotifier {
  DataFrame data = DataFrame();

  DataFrame getDataframe() {
    return data;
  }

  Future<int> saveData(BuildContext context) async {
    setData('date', '');
    await context.read<DatabaseMng>().insertUsage(data);
    context.read<InfoMng>().insertUsageData(data);
    InfoDataframe info = context.read<InfoMng>().getCurrentData();
    return await context.read<DatabaseMng>().updateCard({'current' : info.useMoney(data.getCost())}, info.getId());
  }

  void setData(String sKey, String value) {
    switch(sKey) {
      case "date" :
        data.setDate(DateFormat('yyyyMMdd').format(DateTime.now()));
        break;
      case 'title' :
        data.setTitle(value);
        break;
      case 'detail' :
        data.setDetail(value);
        break;
      case 'cost' :
        data.setCost(int.parse(value));
        break;
      case 'remain' :
        data.setRemain(int.parse(value));
        break;
      case 'iconIdx' :
        data.setIconIndex(int.parse(value));
        break;
      case 'cardID' :
        data.setCardID(int.parse(value));
      default:
        break;
    }
    notifyListeners();
    print(data.toMap());
  }

  String getData(String sKey) {
    switch(sKey) {
      case 'title' :
        return data.getTitle();
      case 'detail' :
        return data.getDetail();
      case 'cost' :
        return data.getCost().toString();
      case 'remain' :
        return data.getRemain().toString();
      case 'iconIdx' :
        return data.getIconIndex().toString();
      default:
        return "";
    }
  }

  void clear(int cardID) {
    data = DataFrame();
    data.setCardID(cardID);
  }
}