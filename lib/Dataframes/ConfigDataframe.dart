
import 'package:untitled2/Utils/ConvertValue.dart';

enum CONFIG {
  E_PIN_CARD
}
class ConfigDataframe {
    int _pinCard = 0;

    ConfigDataframe() {  }

    ConfigDataframe.init(List<Map<String, Object?>> ls) {
      _pinCard = ConvertValue.toInt(ls[CONFIG.E_PIN_CARD.index]['value'].toString());
    }

    int getPinCardIndex() { return _pinCard; }
    void setPinCard(int n) { _pinCard = n; }
}