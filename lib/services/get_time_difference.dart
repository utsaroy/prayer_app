import 'package:prayer/data/time_data.dart';

String getRemainingDuration() {
  DateTime now = DateTime.now();
  List<String> ptimes = getPrayerTime(0);

  List<String> morTime = ptimes[1].split(':'), eveTime = ptimes[2].split(':');
  DateTime prayerTime = DateTime(now.year, now.month, now.day,
      int.parse(morTime[0]), int.parse(morTime[1]));

  if (prayerTime.isAfter(now)) {
    int h = prayerTime.difference(now).inHours;
    int m = prayerTime.difference(now).inMinutes - h * 60;
    return "${h}h ${m}min";
  }

  prayerTime = DateTime(now.year, now.month, now.day,
      12 + int.parse(eveTime[0]), int.parse(eveTime[1]));
  if (prayerTime.isAfter(now)) {
    int h = prayerTime.difference(now).inHours;
    int m = prayerTime.difference(now).inMinutes - h * 60;
    return "${h}h ${m}min";
  }
  return "This Night";
}
