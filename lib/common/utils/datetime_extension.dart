import 'package:intl/intl.dart';

extension DateTimeExt on DateTime?{

   // 2022-10-5
  String get toDashSeparatedYearFirst {
    if(this == null) return '';
    return DateFormat("yyyy-MM-dd").format(this!);
  }


  //10:30 AM
  String get onlyTime {
    if(this == null) return '';
    return DateFormat.jm().format(this!);
  }

  bool get isToday {
    if (this == null) return false;
    final now = DateTime.now();
    return now.toDashSeparatedYearFirst == this!.toDashSeparatedYearFirst;
  }

}