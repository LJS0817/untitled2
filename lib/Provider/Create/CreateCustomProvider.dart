import 'package:flutter/cupertino.dart';
import 'package:untitled2/Dataframes/CustomDataframe.dart';

class CreateCustomProvider extends ChangeNotifier {
  CustomDataframe data = CustomDataframe();


  void clear() {
    data = CustomDataframe();
  }
}