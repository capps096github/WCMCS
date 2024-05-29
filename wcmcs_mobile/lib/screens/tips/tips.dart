import '../../app_exporter.dart';
import 'data/tips_data.dart';

/// this shows tips on how to save water
class TipsScreen extends StatelessWidget {
  /// [TipsScreen] constructor
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// a list view builder for the water tips
    return ListView.builder(
      padding: horizontalPadding16,
      itemCount: waterTips.length,
      itemBuilder: (context, index) {
        // water tip
        final waterTip = waterTips[index];

        return HomeTile(
          title: waterTip.title,
          subtitle: waterTip.description,
          tileColor: appWhite,
          textColor: wcmcsBlack,
        );
      },
    );
  }
}
