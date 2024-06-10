import '../../../../app_exporter.dart';

/// this displays the section tap switch resposible for opening and closing the tap of a section
class SectionTapSwitch extends StatelessWidget {
  /// [SectionTapSwitch] constructor
  const SectionTapSwitch({required this.section, super.key});

  /// section
  final Section section;

  @override
  Widget build(BuildContext context) {
    //
    return SwitchBody(section: section);
  }
}

/// this has the body of the tap switch
class SwitchBody extends ConsumerStatefulWidget {
  /// [SwitchBody] constructor
  const SwitchBody({
    required this.section,
    super.key,
  });

  /// section
  final Section section;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SwitchBodyState();
}

class _SwitchBodyState extends ConsumerState<SwitchBody> {
  late bool isOpen;

  @override
  void initState() {
    super.initState();
    isOpen = widget.section.isOpen;
  }

  @override
  Widget build(BuildContext context) {
    // tile color
    final tileColor = isOpen ? tapOpenColor : tapClosedColor;

    // text color
    const textColor = appWhite;

    final newValue = isOpen ? 0 : 1;

    return SizedBox(
      height: 100,
      key: ValueKey(isOpen),
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
            key: ValueKey(isOpen),
            duration: halfSeconds,
            padding: padding16,
            decoration: BoxDecoration(
              color: tileColor,
              borderRadius: borderRadius16,
            ),
            child: Row(
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

  Future<void> updateController(int newValue) async {
    // print new value
    printer('New Value: $newValue');

    // update the section
    await SectionService.updateControllerValue(
      section: widget.section,
      newValue: newValue,
    ).then((_) {
      setState(() {
        isOpen = !isOpen;
      });
    });
  }
}
