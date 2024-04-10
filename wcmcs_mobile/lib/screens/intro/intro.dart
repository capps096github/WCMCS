import '../../wcmcs_exporter.dart';

/// this is screen
class IntroScreen extends StatelessWidget {
  ///
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: horizontalPadding16,
      children: const [
        Spacing(of: spacing2),
        BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: 'Hey Cephas',
            color: wcmcsColor,
            fontSize: 30,
          ),
          description: 'Welcome back to Water Warden',
        ),
        Spacing(of: spacing32),
        BoldTileWithDescription(
          boldTitle: BoldTitle(
            text: "You're almost there!",
            color: wcmcsColor,
            fontSize: 30,
          ),
          description: "Here's a quick guide to help you get started",
        ),
        Spacing(of: spacing16),
        HomeTile(
          title: 'Manage Your Water with Ease',
          subtitle: 'Get real-time updates on your water usage',
          iconWidget: AppLogo(
            logoSize: 24,
            logoColor: wcmcsWhite,
          ),
        ),
        HomeTile(
          tileColor: wcmcsWhite,
          textColor: wcmcsColor,
          title: 'Manage Your Water with Ease',
          subtitle: 'Get real-time updates on your water usage',
          iconWidget: AppLogo(
            logoSize: 24,
          ),
        ),
      ],
    );
  }
}
