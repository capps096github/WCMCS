import 'dart:math';

import '../../../app_exporter.dart';
import '../detail/section_detail.dart';

/// this contains the details of a given section
class SectionCard extends StatelessWidget {
  /// [SectionCard] constructor
  const SectionCard({required this.section, super.key});

  /// section
  final Section section;

  @override
  Widget build(BuildContext context) {
    // text color
    const textColor = appWhite;

    // tile color
    final tileColor = allCardColors[Random().nextInt(allCardColors.length)];

    // icon
    final icon = section.icon;

    // label
    final label = section.label;

    // collection
    final collection = section.collection;

    return Padding(
      padding: verticalPadding8,
      child: OpenRoute(
        to: SectionDetail(
          section: section,
        ),
        closedShape: const RoundedRectangleBorder(
          borderRadius: borderRadius16,
        ),
        closedBuilder: (ctx, openSection) => SizedBox(
          height: 350,
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
              onTap: openSection,
              child: Ink(
                decoration: BoxDecoration(
                  color: tileColor,
                  borderRadius: borderRadius16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Icon(
                          icon,
                          color: textColor,
                          size: 150,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: textColor,
                        border: Border.all(
                          color: tileColor,
                          width: 2,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: circularRadius16,
                          bottomRight: circularRadius16,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            label,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.montserrat(
                              color: tileColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          ThickHorizontalDivider(dividerColor: tileColor),
                          Text(
                            '/$collection',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: tileColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
