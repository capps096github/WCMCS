import 'package:cached_network_image/cached_network_image.dart';

import '../../app_exporter.dart';
import 'components/card_gradient.dart';
import 'components/card_label.dart';
import 'models/home_card_item.dart';

/// card shown on the intro home screen
class HomeCard extends ConsumerWidget {
  /// [HomeCard] constructor
  const HomeCard({
    required this.cardItem,
    super.key,
  });

  /// card item to display
  final HomeCardItem cardItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const borderColor = appColor;

    //
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacing4),
      child: InkWell(
        onTap: cardItem.onTap ??
            () {
              // navigate to the screen
              push(ref, to: cardItem.screenPath);
            },
        customBorder: const RoundedRectangleBorder(borderRadius: borderRadius8),
        child: Ink(
          child: Padding(
            padding: padding2,
            child: AspectRatio(
              aspectRatio: 4 / 3,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 360),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius8,
                    border: Border.all(
                      color: borderColor,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: borderRadius6,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                          borderRadius: borderRadius8,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            color: appColor.withOpacity(.2),
                            child: CachedNetworkImage(
                              imageUrl: cardItem.imageUrl,
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  ColoredBox(color: appColor.withOpacity(.2)),
                              errorWidget: (context, url, _) =>
                                  const ColoredBox(color: appColor),
                            ),
                          ),
                        ),

                        // gradient
                        const CardGradient(),

                        // content
                        CardLabel(cardItem: cardItem),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
