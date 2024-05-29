import '../../../app_exporter.dart';

/// back button to pop off this screen and go to a given screen
class AppBackButton extends ConsumerWidget {
  ///This is a Back Button that shows an Ad to the User.
  const AppBackButton({
    super.key,
    this.path,
    this.iconColor = appWhite,
  });

  /// go to path
  final String? path;

  /// icon color
  final Color iconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(
        Icons.arrow_back,
        color: iconColor,
      ),
      onPressed: () {
        /// show ad
        //

        /// set

        /// pop page, if possible show ads
        (path != null) ? go(ref, to: path!) : context.pop();
      },
    );
  }
}
