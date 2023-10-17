String changeDateToDay(DateTime dateat) {
  String date = "";
  int d = DateTime.now().difference(DateTime.parse(dateat.toString())).inHours;
  if (d < 24) {
    date = "ساعة ${d.toString()}";
  } else {
    d = DateTime.now().difference(DateTime.parse(dateat.toString())).inDays;
    if (d < 31) {
      date = "يوم ${d.toString()}";
    } else {
      if (d < 365) {
        date = "شهر ${(d / 30).round().toString()}";
      } else {
        date = "سنة ${(d / 365).round().toString()}";
      }
    }
  }
  return date;
}
