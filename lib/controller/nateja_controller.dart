import 'package:adhan/adhan.dart';
import 'package:get/get.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class NatejaController extends GetxController {
  final HijriCalendar today = HijriCalendar.now();
  int nategaType = 0;
  //More Govers
  void moreGoveers() {
    nategaType = nategaType == 0 ? 1 : 0;
    update();
  }

  //Format Prayer Time
  String formatPrayerTime(DateTime prayerTime) {
    String formattedTime = DateFormat('mm    hh').format(prayerTime);
    return formattedTime;
  }

  //Get Prayer Time
  String getPrayTime(double latitude, double longitude, String prayerName) {
    final Coordinates myCoordinates;
    final CalculationParameters params;
    myCoordinates = Coordinates(latitude, longitude);
    params = CalculationMethod.egyptian.getParameters();
    params.madhab = Madhab.shafi;

    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    switch (prayerName.toLowerCase()) {
      case 'fajr':
        return formatPrayerTime(prayerTimes.fajr);
      case 'sunrise':
        return formatPrayerTime(prayerTimes.sunrise);
      case 'dhuhr':
        return formatPrayerTime(prayerTimes.dhuhr);
      case 'asr':
        return formatPrayerTime(prayerTimes.asr);
      case 'maghrib':
        return formatPrayerTime(prayerTimes.maghrib);
      case 'isha':
        return formatPrayerTime(prayerTimes.isha);
      default:
        return 'Prayer name not recognized';
    }
  }

  //Get Hegry Month Name
  String hijriMonth(String month) {
    var months = {
      '1': 'مُحَرَّمْ',
      '2': 'صَفَرْ',
      '3': 'رَبِيعُ الأَوَّلْ',
      '4': 'رَبِيعُ الآخِرْ',
      '5': 'جُمادَى الأُولَىْ',
      '6': 'جُمادَى الآخِرَةْ',
      '7': 'رَجَبْ',
      '8': 'شَعْبَانْ',
      '9': 'رَمَضَانْ',
      '10': 'شَوَّالْ',
      '11': 'ذُو القَعْدَةْ',
      '12': 'ذُو الحِجَّْة'
    };
    return months[month] ?? 'Invalid month';
  }

  //Get Month Name
  String gregorianMonth(String month) {
    var months = {
      '1': 'يَنَايِرْ',
      '2': 'فِبْرَايِرْ',
      '3': 'مَارِسْ',
      '4': 'أَبْرِيلْ',
      '5': 'مَايُوْ',
      '6': 'يُونِيُوْ',
      '7': 'يُولِيُوْ',
      '8': 'أَغُسْطُسْ',
      '9': 'سِبْتَمْبِرْ',
      '10': 'أُكْتُوبِرْ',
      '11': 'نُوفَمْبِرْ',
      '12': 'دِيسَمْبِرْ',
    };
    return months[month] ?? 'Invalid month';
  }
}
