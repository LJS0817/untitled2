import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Dataframes/DataFrame.dart';
import 'package:untitled2/Dataframes/InfoDataframe.dart';
import 'package:untitled2/Mng/DatabaseMng.dart';
import 'package:untitled2/Utils/ConvertValue.dart';
import 'package:untitled2/Utils/DateViewer.dart';

import '../../Mng/InfoMng.dart';

class CreateUsageProvider extends ChangeNotifier {
  DataFrame data = DataFrame();

  DataFrame getDataframe() {
    return data;
  }

  void saveData(BuildContext context) async {
    setData('date', '');
    InfoDataframe info = Provider.of<InfoMng>(context, listen: false).getCurrentData();
    if(info.getList().length > 1) data.setId(ConvertValue.toInt(info.getList()[info.getList().length - 1]['id']) + 1);
    await context.read<InfoMng>().insertUsageData(context, data);
  }

  void setData(String sKey, String value) {
    switch(sKey) {
      case "date" :
        data.setDate(DateViewer.getDate());
        break;
      case 'title' :
        data.setTitle(value);
        break;
      case 'detail' :
        data.setDetail(value);
        break;
      case 'cost' :
        data.setCost(int.parse(value.isEmpty ? '0' : value));
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