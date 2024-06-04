import '../../../app_exporter.dart';

/// this is shown when a given section has no data to display at the moment
class NoDataScreen extends StatelessWidget {
  /// [NoDataScreen] constructor
  const NoDataScreen({
    required this.section,
    super.key,
  });

  // form
  final Section section;

  @override
  Widget build(BuildContext context) {
    // return NotFoundEmptyScreen(
    //   reason: 'Form Unavailable\n\n${form.conditionToActivate}',
    //   svgPath: noForm,
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text(section.label),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('No Data Available'),
            // add tips to tell a user to add a pipe to the water tank and then make sure that its wifi
          ],
        ),
      ),
    );
  }
}
