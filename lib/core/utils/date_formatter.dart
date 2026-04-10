import 'package:intl/intl.dart';

class DateUtilsHelper {
  static int getWeekOfMonth(DateTime date) {
    DateTime firstDayOfMonth = DateTime(date.year, date.month, 1);
    int dayOfMonth = date.day;
    int firstWeekdayValue = firstDayOfMonth.weekday;

    return ((dayOfMonth + firstWeekdayValue - 2) / 7).floor() + 1;
  }

  static int getTotalWeeksInMonth(DateTime date) {
    DateTime lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    return getWeekOfMonth(lastDayOfMonth);
  }

  static List<String> weekDays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

  static String formatMonthYear(DateTime date) {
    return DateFormat('MMM yyyy').format(date);
  }

  static List<DateTime> getWeekDays(DateTime date) {
    DateTime startOfWeek = date.subtract(Duration(days: date.weekday - 1));

    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  static String getShortWeekday(DateTime date) {
    const weekdays = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
    return weekdays[date.weekday - 1];
  }

  static String formatDateForHeader(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return "Today, ${DateFormat('d MMM yyyy').format(date)}";
    }
    return DateFormat('EEEE, d MMM yyyy').format(date);
  }
}

