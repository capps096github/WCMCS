import '../../../app_exporter.dart';
import '../data/tank_type.dart';
import 'add_tank_button.dart';
import 'circumference_field.dart';
import 'tank_type_card.dart';

/// this is the screen for adding a tank
class AddTankScreen extends ConsumerWidget {
  /// [AddTankScreen] constructor
  const AddTankScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get tank type
    final tankType = ref.watch(selectedTankTypeProvider);

    // tank form key
    final tankFormKey = ref.watch(tankFormKeyProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text('Add Tank'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // reset tank and other providers
            resetTankProviders(ref);
            // pop the screen
            pop(ref);
          },
        ),
      ),
      body: KeyboardUnfocusWrapper(
        child: Form(
          key: tankFormKey,
          child: ListView(
            padding: horizontalPadding16,
            children: [
              const Spacing(of: spacing16),
              const BoldTileWithDescription(
                textAlign: TextAlign.left,
                boldTitle: BoldTitle(
                  textAlign: TextAlign.left,
                  text: 'Enter Your Tank Details',
                  color: appColor,
                  fontSize: 25,
                ),
                descFontSize: 14,
                description:
                    'Enter the details of your tank to get started with the tank measurements',
              ),
              const Spacing(of: spacing16),

              const Center(child: ThickHorizontalDivider(thickness: 10)),

              const BoldTitle(
                textAlign: TextAlign.left,
                text: 'What is the shape of your tank?',
                color: appBlack,
                fontSize: 18,
              ),
              const Spacing(of: spacing8),
              // row of card
              Row(
                children: [
                  // card for cylindrical tank
                  Expanded(
                    child: TankTypeCard(
                      tankType: cylindricalTankType,
                    ),
                  ),
                  const Spacing(of: spacing16),
                  // card for rectangular tank
                  Expanded(
                    child: TankTypeCard(
                      tankType: cuboidTankType,
                    ),
                  ),
                ],
              ),

              Column(
                children: (tankType.name.isNotEmpty)
                    ? [
                        // show field based on selected tank type
                        if (tankType.isCylindrical) ...[
                          const Spacing(of: spacing16),
                          // circumference field
                          NumberField(
                            numberProvider: circumferenceProvider,
                            fieldLabel: 'Circumference',
                          ),
                          const Spacing(of: spacing16),
                          // height field
                          NumberField(
                            numberProvider: heightProvider,
                            fieldLabel: 'Height',
                          ),
                        ] else ...[
                          const Spacing(of: spacing16),
                          // length field
                          NumberField(
                            numberProvider: lengthProvider,
                            fieldLabel: 'Length',
                          ),

                          const Spacing(of: spacing16),
                          // width field
                          NumberField(
                            numberProvider: widthProvider,
                            fieldLabel: 'Width',
                          ),
                          const Spacing(of: spacing16),

                          // height field
                          NumberField(
                            numberProvider: heightProvider,
                            fieldLabel: 'Height',
                          ),
                        ],

                        // const SectionNameField(fieldColor: appColor),
                        const Spacing(of: spacing32),
                        const AddTankButton(),
                      ]
                    : [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
