import 'package:easy_date_timeline/easy_date_timeline.dart';

import '../../../../app_exporter.dart';
import '../../data/selected_date_provider.dart';

/// this displays the water flow calendar and allows the user to tap on a date and acts as a filter for our calendar and chart and other components that depend on the water flow data
class WaterFlowCalendar extends ConsumerWidget {
  /// [WaterFlowCalendar] constructor
  const WaterFlowCalendar({
    required this.activeColor,
    super.key,
  });

  /// color
  final Color activeColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // initial date, is a date 5 days before
    // final initialDate = DateTime.now().subtract(const Duration(days: 5));

    return EasyDateTimeLine(
      initialDate: DateTime.now(),

      // disabledDates we will put those dates where water wasn't collected
      onDateChange: (selectedDate) {
        // update the selected date provider
        ref
            .read(selectedDateProvider.notifier)
            .updateSelectedDate(selectedDate);
      },
      activeColor: activeColor,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        dateFormatter: DateFormatter.fullDateDayAsStrMY(),
      ),
      dayProps: const EasyDayProps(
        activeDayStyle: DayStyle(
          borderRadius: 32,
        ),
        inactiveDayStyle: DayStyle(
          borderRadius: 32,
        ),
      ),
      timeLineProps: const EasyTimeLineProps(
        hPadding: 16, // padding from left and right
        separatorPadding: 16, // padding between days
      ),
    );
  }
}
