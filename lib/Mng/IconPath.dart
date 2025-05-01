import 'dart:developer';

enum ICON {
  E_COMPUTER_KEYBOARD,
  E_COMPUTER_MONITOR,
  E_COMPUTER_MOUSE,
  E_COMPUTER_CONTROLLER,

  E_FURNITURE_LAMP,
  E_FURNITURE_LIGHT,
  E_FURNITURE_SOFA,

  E_HOBBY_BASEBALL,
  E_HOBBY_BASKETBALLL,
  E_HOBBY_BOWLING,
  E_HOBBY_FOOTBALL,
  E_HOBBY_KNITTING,
  E_HOBBY_SHOPPING,
  E_HOBBY_TENNIS,
  E_HOBBY_TRAVEL,

  E_TRANS_BUS,
  E_TRANS_PLANE,
  E_TRANS_SHIP,
  E_TRANS_SUBWAY,
  E_TRANS_TRAIN,

  E_APP,
  E_CLOTH,
  E_COFFEE,
  E_DEVICE,
  E_EARBUDS,
  E_FOOD,
  E_GIFT,
  E_HOTEL,
  E_NOTE,

  E_MENU_ADD,
  E_MENU_CARD,
  E_MENU_CONFIG,
  E_MENU_DELETE,
  E_MENU_EDIT,
  E_MENU_LIST,
  E_MENU_SAVE,
}

class IconPath {
  static const String _header = "assets/icons";
  static const String _menuHeader = "/menu/";
  static const String _addHeader = "/category/";
  static const List<String> _path = [
    "computer/keyboard.svg",
    "computer/monitor.svg",
    "computer/mouse.svg",
    "computer/game.svg",

    "furniture/lamp.svg",
    "furniture/light.svg",
    "furniture/sofa.svg",

    "hobby/baseball.svg",
    "hobby/basketball.svg",
    "hobby/bowling.svg",
    "hobby/football.svg",
    "hobby/knitting.svg",
    "hobby/shopping.svg",
    "hobby/tennis.svg",
    "hobby/travel.svg",

    "transfer/bus.svg",
    "transfer/plane.svg",
    "transfer/ship.svg",
    "transfer/subway.svg",
    "transfer/train.svg",

    "app.svg",
    "cloth.svg",
    "coffee.svg",
    "device.svg",
    "earbuds.svg",
    "food.svg",
    "gift.svg",
    "hotel.svg",
    "note.svg",

    "add.svg",
    "card.svg",
    "config.svg",
    "delete.svg",
    "edit.svg",
    "list.svg",
    "save.svg",
  ];
  static String getPath(ICON t) {
    return _header + ((t.index < ICON.E_MENU_ADD.index) ? _addHeader : _menuHeader) + _path[t.index];
  }
  static String getPathUsingInt(int idx) {
    return _header  + ((idx < ICON.E_MENU_ADD.index) ? _addHeader : _menuHeader) +  _path[idx];
  }
  static int getLength() {
    return ICON.E_MENU_ADD.index;
  }
}