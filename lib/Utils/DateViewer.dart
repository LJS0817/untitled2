import 'package:intl/intl.dart';

class DateViewer {
  static String getDate() {
    return DateFormat('yyyyMMdd').format(DateTime.now());
  }
}