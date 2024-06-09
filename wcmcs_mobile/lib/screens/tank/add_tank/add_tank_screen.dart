import '../../../app_exporter.dart';
import 'add_tank_button.dart';

/// this is the screen for adding a tank
class AddTankScreen extends ConsumerWidget {
  /// [AddTankScreen] constructor
  const AddTankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Add Section'),
      ),
      body: const KeyboardUnfocusWrapper(
        child: Padding(
          padding: padding16,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BoldTileWithDescription(
                textAlign: TextAlign.left,
                boldTitle: BoldTitle(
                  textAlign: TextAlign.left,
                  text: 'Enter The Circumference of Your Tank',
                  color: appColor,
                  fontSize: 25,
                ),
                descFontSize: 14,
                description:
                    'This is distance around the tank. For example, "5 meters" or "10 meters".',
              ),
              Spacing(of: spacing16),
              // const SectionNameField(fieldColor: appColor),
              Spacing(of: spacing16),
              AddTankButton(),
            ],
          ),
        ),
      ),
    );
  }
}
