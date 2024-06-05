// class to hold the type of chart we are showing e.g daily, weekly, monthly
import '../../../charts/chart_data.dart';

/// this holds the type of chart we are showing e.g daily, weekly, monthly
class ChartType {
  /// [ChartType] constructor
  const ChartType({required this.title, required this.chartData});

  /// title
  final String title;

  /// chart data
  final List<ChartData> chartData;
}
