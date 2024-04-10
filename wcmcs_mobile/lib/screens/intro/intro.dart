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
        BoldTitle(
          text: 'Hey Cephas',
          color: wcmcsColor,
          fontSize: 30,
        ),
        Spacing(of: spacing2),
        // description
        Text(
          'Welcome back to Water Warden',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacing(of: spacing32),

        BoldTitle(
          text: "You're almost there!",
          color: wcmcsColor,
          fontSize: 30,
        ),
        // description
        Text(
          "Here's a quick guide to help you get started",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
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
