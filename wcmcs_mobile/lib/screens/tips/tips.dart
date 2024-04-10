import '../../wcmcs_exporter.dart';
import 'data/tips_data.dart';

/// this shows tips on how to save water
class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// a list view builder for the water tips
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: waterTips.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              shape: const RoundedRectangleBorder(borderRadius: borderRadius8),
              title: Text(
                waterTips[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(waterTips[index].description),
              // leading: Image.asset(waterTips[index].image),
            ),
          );
        },
      ),
    );
  }
}
