import '../../app_exporter.dart';
import 'home_card.dart';
import 'models/items_data.dart';

/// this is the app home page
class AppHome extends StatelessWidget {
  /// [AppHome] constructor
  const AppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: horizontalPadding16,
      children: [
        const UserGreeting(),
        const Spacing(of: spacing32),
        const Center(
          child: ThickHorizontalDivider(
            dividerColor: appNavy,
            thickness: 10,
            dividerWidth: 50,
            margin: margin16,
          ),
        ),
        const BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'What would you like to do today?',
            color: appColor,
            fontSize: 30,
          ),
          description: "Here's a quick guide to help you get started",
        ),
        const Spacing(of: spacing16),
        ...homeCardItems.map((cardItem) {
          return HomeCard(
            cardItem: cardItem,
          );
        }),
        const Spacing(of: spacing16),
      ],
    );
  }
}
