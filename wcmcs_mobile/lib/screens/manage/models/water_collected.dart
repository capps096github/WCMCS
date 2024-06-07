import 'water_flow.dart';

/// water collected model
class WaterCollected {
  /// [WaterCollected] constructor
  const WaterCollected({
    required this.waterFlows,
  });

  /// list of water flows
  final List<WaterFlow> waterFlows;

  /// get the total litres of water collected
  double get totalLitres => waterFlows.fold<double>(
        0,
        (previousValue, element) => previousValue + element.value,
      );

  /// reversed water flows
  List<WaterFlow> get reversedWaterFlows => waterFlows.reversed.toList();

  /// get the total price of water collected
  /// [pricePerLitre] is the price per litre
  double getPrice(num pricePerLitre) => totalLitres * pricePerLitre;

  /// chart data from water flows
  List<WaterChartData> get chartData {
    final data = <WaterChartData>[];

    // add water flows to data
    for (final waterFlow in waterFlows) {
      data.add(
        WaterChartData(
          waterFlow.time,
          waterFlow.value.toDouble(),
        ),
      );
    }
    return data;
  }
}

/// this holds values for the bar
class WaterChartData {
  ///
  WaterChartData(this.x, this.y);

  /// x-axis value
  final String x;

  /// y-axis value
  final double y;
}
