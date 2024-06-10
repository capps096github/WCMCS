import 'package:intl/intl.dart';

/// Formats to UGX currency
final ugxFormatter = NumberFormat.simpleCurrency(
  decimalDigits: 0,
  name: 'UGX ',
);

///Formats the date to a string
final dateFormatter = DateFormat('EEEE, dd MMMM yyyy');

/// Formats the time to a string
final timeFormatter = DateFormat('HH:mm:ss');
/// get only the time from the date and display it
// String formatTime(DateTime date) {
//   return '${date.hour}:${date.minute}:${date.second}';
// }

/// a number formatter that formats the number to a string
/// if the number is greater than 1000, it will be formatted to 1k
/// if the number is greater than 1000000, it will be formatted to 1m etc
/// it will also have commas in the number
final numberFormatter = NumberFormat.simpleCurrency(
  decimalDigits: 3,
  name: '',
);
