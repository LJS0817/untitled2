import 'package:intl/intl.dart';

class ConvertValue {

  static String costToString(int m) {
    if(m < 0) {
      return '-${NumberFormat('###,###').format(m * -1)}';
    }
    return NumberFormat('###,###').format(m);
  }
}