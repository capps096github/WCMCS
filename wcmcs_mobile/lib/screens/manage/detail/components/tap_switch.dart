import '../../../../app_exporter.dart';
import '../../data/water_db_refence.dart';

/// this displays the section tap switch resposible for opening and closing the tap of a section
class SectionTapSwitch extends ConsumerWidget {
  /// [SectionTapSwitch] constructor
  const SectionTapSwitch({required this.section, super.key});

  /// section
  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // get tap state stream
    final tapStateStream = ref.watch(tapStateProvider(section));

    return tapStateStream.when(
      data: (tapState) {
        printer('Tap State:: $tapState');
        //
        return SwitchBodyx(section: section, tapState: tapState);
      },
      error: (error, stackTrace) => const LoadingContainer(
        loadingColor: errorColor,
        height: 100,
      ),
      loading: () => const LoadingContainer(height: 100),
    );
  }
}

///
class SwitchBodyx extends ConsumerWidget {
  /// [SwitchBodyx] constructor
  const SwitchBodyx({
    required this.section,
    required this.tapState,
    super.key,
  });

  /// section
  final Section section;

  /// tap state
  final bool tapState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpen = tapState;

    // tile color
    final tileColor = isOpen ? tapOpenColor : tapClosedColor;

    // text color
    const textColor = appWhite;

    final newValue = isOpen ? 0 : 1;

    printer('Open State:: $tapState');

    return SizedBox(
      height: 100,
      child: Material(
        color: appTransparent,
        shadowColor: textColor,
        clipBehavior: Clip.antiAlias,
        borderRadius: borderRadius16,
        child: InkWell(
          splashColor: tileColor,
          highlightColor: tileColor.withOpacity(.5),
          customBorder: const RoundedRectangleBorder(
            borderRadius: borderRadius16,
          ),
          onTap: () async => updateController(newValue),
          child: AnimatedContainer(
            duration: halfSeconds,
            padding: padding16,
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: borderRadius16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldTileWithDescription(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  boldTitle: BoldTitle(
                    text: isOpen ? 'OPEN' : 'CLOSED',
                    fontSize: 28,
                    textAlign: TextAlign.left,
                  ),
                  textAlign: TextAlign.left,
                  color: textColor,
                  descFontSize: 10,
                  description: "Tap to ${isOpen ? "close" : "open"} the tap",
                ),
                const Spacer(),
                const Spacing(of: spacing8),
                // switch
                // Adjust the scale factor for desired size increase
                Expanded(
                  child: Transform.scale(
                    scale: 2,
                    child: Switch(
                      value: isOpen,
                      onChanged: (_) async => updateController(newValue),
                      activeColor: textColor,
                    ),
                  ),
                ),
                const Spacing(of: spacing8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ///
  Future<void> updateController(int newValue) async {
    // print new value
    printer('New Value: $newValue');

    // update the section
    await SectionService.updateControllerValue(
      section: section,
      newValue: newValue,
    );
  }
}
