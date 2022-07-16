import 'package:intl/intl.dart';

class SystemNoFormatter{
  static SystemNoFormatter instance = SystemNoFormatter._init();
  SystemNoFormatter._init();

  final systemNo = DateFormat('yyyyMMddHHmmsskk');
}