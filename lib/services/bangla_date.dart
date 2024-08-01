const Map<String, String> bDigits = {
  '0': "০",
  '1': "১",
  '2': "২",
  '3': "৩",
  '4': "৪",
  '5': "৫",
  '6': "৬",
  '7': "৭",
  '8': "৮",
  '9': "৯",
};

const bDayNames = [
  "সোমবার",
  "মঙ্গলবার",
  "বুধবার",
  "বৃহস্পতিবার",
  "শুক্রবার",
  "শনিবার",
  "রবিবার",
];
const bMonthName = [
  'বৈশাখ, ',
  'জ্যৈষ্ঠ, ',
  'আষাঢ়, ',
  'শ্রাবণ, ',
  'ভাদ্র, ',
  'আশ্বিন, ',
  'কার্তিক, ',
  'অগ্রহায়ণ, ',
  'পৌষ, ',
  'মাঘ, ',
  'ফাল্গুন, ',
  'চৈত্র, '
];
String convertDigits(int num) {
  String string = num.toString(), ret = "";
  for (var i = 0; i < string.length; i++) {
    ret += bDigits[string[i]] ?? "";
  }
  return ret;
}

bool checkLeapYear(int year) {
  return (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0);
}

String bSuffix(int d) {
  if (d == 1) {
    return "লা ";
  } else if (d == 2 || d == 3) {
    return "রা ";
  } else if (d == 4) {
    return "ঠা ";
  } else if (d < 20) {
    return "ই ";
  } else {
    return "শে ";
  }
}

String getDayName() {
  var today = DateTime.now();
  var day = today.weekday;
  return bDayNames[(day - 1)];
}

String getBanglaDate() {
  var today = DateTime.now();

  var eYear = today.year;
  bool isLeapYear = checkLeapYear(eYear);

  int bDate, bMonth = 0, bYear;
  var startDate = DateTime(eYear, 4, isLeapYear ? 14 : 15);
  bYear = eYear - (startDate.difference(today).isNegative ? 593 : 594);

  if (today.difference(startDate).isNegative) {
    isLeapYear = checkLeapYear(eYear - 1);
    startDate = DateTime(eYear - 1, 4, isLeapYear ? 14 : 15);
  }

  int days = today.difference(startDate).inDays + 1;

  int cnt = 0;
  bDate = days;
  var bmDay = [
    31,
    31,
    31,
    31,
    31,
    isLeapYear ? 31 : 30,
    30,
    30,
    30,
    30,
    30,
    30
  ];

  for (int i = 0; i < bmDay.length; i++) {
    cnt += bmDay[i];
    if (days > cnt) {
      bMonth++;
      bDate = days - cnt;
    } else {
      break;
    }
  }

  return (convertDigits(bDate) +
      bSuffix(bDate) +
      bMonthName[bMonth] +
      convertDigits(bYear));
}
