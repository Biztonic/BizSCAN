import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDate(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMMMMd(locale).format(date);
  }

  static String formatTime(DateTime date, {String locale = 'en'}) {
    return DateFormat.jm(locale).format(date);
  }

  static String formatDateTime(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMd(locale).add_jm().format(date);
  }

  static String formatCompactDate(DateTime date, {String locale = 'en'}) {
    return DateFormat.yMd(locale).format(date);
  }

  static String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return '${twoDigits(duration.inHours)}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }
}
