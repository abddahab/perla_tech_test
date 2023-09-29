import 'package:easy_localization/easy_localization.dart';

extension DateTimeExtension on DateTime {
  String stringDateFormat (){
    return DateFormat.yMMMd('en_US').format(this);
  }
}