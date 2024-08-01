import 'package:prayer/data/ahban_dhoni_data.dart';
import 'package:prayer/data/mantra_data.dart';
import 'package:prayer/data/prayer_data.dart';
import 'package:prayer/data/sangeet_data.dart';
import 'package:prayer/data/satya_data.dart';

List<String> getSangeetList() {
  return sangeetTitleList;
}

List<List<String>> getSangeetContent(int indx) {
  return [sangeetContentList[indx]];
}

List<String> getMantraList() {
  return mantraTitles;
}

List<List<String>> getMantraContent(int indx) {
  return [
    [mantraContents[indx]]
  ];
}

List<String> getPrayerTitles() {
  return [
    "প্রাতঃকালীন বিনতি",
    "সন্ধ্যাকালীন বিনতি",
    "আহবান ধ্বনি",
  ];
}

List<List<String>> getPrayerContent(int indx) {
  if (indx == 2) {
    return [
      [ahbanDhoni]
    ];
  }
  return [
    for (var i in mPrayerData.entries)
      (indx == 1 && i.key == "প্রাতঃকালীন বিনতি")
          ? (['সন্ধ্যাকালীন বিনতি', ePrayerData, ''])
          : ([i.key, i.value, ''])
  ];
}

List<List<String>> getSatyaContent(int indx) {
  return [
    [satContents[indx]]
  ];
}

//unused function
List<String> getContentTileData(List<String> list) {
  if (list.length == 3) {
    return [list[0], list[1], list[2]];
  } else if (list.length == 2) {
    return ['', list[0], list[1]];
  } else if (list.length == 1) {
    return ['', list[0], ''];
  } else {
    return ['', '', ''];
  }
}
