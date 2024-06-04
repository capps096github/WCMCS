import '../../../app_exporter.dart';
import '../models/section.dart';

/// this shows the details of a given section including its water flow and other details
class SectionDetail extends ConsumerWidget {
  /// [SectionDetail] constructor
  const SectionDetail({
    required this.section,
    super.key,
  });

  /// section
  final Section section;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
