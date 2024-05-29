import '../../../app_exporter.dart';
import '../functions/calcut_google_auth.dart';

/// final isGoogleButtonTappedProvider = StateProvider((ref) => false);

/// button to enable sign in or sign up using google auth
class GoogleAuthButton extends ConsumerStatefulWidget {
  /// [GoogleAuthButton] constructor
  const GoogleAuthButton({
    super.key,
    this.text = 'SIGN IN',
  });

  /// text to display on the button either 'SIGN IN' or 'SIGN UP'
  final String text;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GoogleAuthButtonState();
}

class _GoogleAuthButtonState extends ConsumerState<GoogleAuthButton> {
  /// istapped
  bool isButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    const color = appWhite;

    return CircularProgressAppButton(
      isTapped: isButtonTapped,
      text: '${widget.text} WITH GOOGLE',
      onTap: () async {
        /// Unfocus Keyboard
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }

        /// set tapped to true
        setState(() {
          isButtonTapped = true;
        });

        ///  Google Auth
        await calcutGoogleAuth().then((_) {
          /// Go to Home
          /// context.go(homePath);
          if (mounted) {
            go(ref, to: homePath);
          }
        });
      },
      iconWidget: SvgPicture.asset(
        'images/google.svg',
        height: 20,
        width: 20,
      ),
      textColor: appBlack,
      buttonColor: color,
    );
  }
}
