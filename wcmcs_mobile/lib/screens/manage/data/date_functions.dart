/// this returns the date in dashed format of 3-4-2024
// Non autoDispose provider
String dashDate(DateTime currentDate) {
  final date = '${currentDate.day}-${currentDate.month}-${currentDate.year}';
  return date;
}

/// change a dashed date 3-4-2024 to a DateTime
DateTime dashToDate(String date) {
  final dateParts = date.split('-');
  // day
  final day = int.parse(dateParts[0]);
  // month
  final month = int.parse(dateParts[1]);
  // year
  final year = int.parse(dateParts[2]);

  return DateTime(year, month, day);
}
