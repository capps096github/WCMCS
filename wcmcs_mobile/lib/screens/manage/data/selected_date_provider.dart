import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'date_functions.dart';

part 'selected_date_provider.g.dart';


/// this is the selected date provider
/// with a new mdification of state provider
@riverpod
class SelectedDate extends _$SelectedDate {
  @override
  String build() {
    return dashDate(DateTime.now());
  }

  /// update the selected date
  void updateSelectedDate(DateTime selectedDate) {
    state = dashDate(selectedDate);
  }
}
