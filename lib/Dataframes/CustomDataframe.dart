import '../Utils/ConvertValue.dart';

class CustomDataframe {
  int _id = 1;
  String _title = "";
  String _detail = "";
  int _iconIdx = 0;
  int _cost = 0;

  CustomDataframe() {}

  CustomDataframe.init(Map<String, Object?> data) {
    _id = ConvertValue.toInt(data["id"]);
    _title = data["title"].toString();
    _detail = data["detail"].toString();
    _cost = ConvertValue.toInt(data["cost"]);
    _iconIdx = ConvertValue.toInt(data["iconIdx"]);
  }

  int getId() { return _id; }
  void setId(int id) { _id = id; }

  String getTitle() { return _title; }
  void setTitle(String str) { _title = str; }

  String getDetail() { return _detail; }
  void setDetail(String str) { _detail = str; }

  int getIconIdx() { return _iconIdx; }
  void setIconIdx(int i) { _iconIdx = i; }

  int getCost() { return _cost; }
  void setCost(int i) { _cost = i; }

  Map<String, Object> toMap() {
    return {
      'id' : _id,
      'title' : _title,
      'detail' : _detail,
      'cost' : _cost,
      'iconIdx' : _iconIdx,
    };
  }

  Map<String, Object> toMapWithoutId() {
    return {
      'title' : _title,
      'detail' : _detail,
      'cost' : _cost,
      'iconIdx' : _iconIdx,
    };
  }
}