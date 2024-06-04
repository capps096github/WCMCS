import 'package:flutter/gestures.dart';

import '../../app_exporter.dart';

/// This is the disclaimer for the app
class AppDisclaimer extends StatelessWidget {
  /// [AppDisclaimer] constructor
  const AppDisclaimer({
    super.key,
    this.continuingColor = appColor,
    this.termsPrivacycolor = appNavy,
  });

  /// color for the continuing text
  final Color continuingColor;

  /// color for the terms and privacy policy
  final Color termsPrivacycolor;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing, you declare that you accept The WCMCS ',
        style: GoogleFonts.montserrat(color: continuingColor, fontSize: 10),
        children: <TextSpan>[
          TextSpan(
            text: 'Terms of Service',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                //TODO go to the Terms Page
                // context.push(termsPath);
              },
            style: TextStyle(
              color: termsPrivacycolor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const TextSpan(text: '  and  '),
          TextSpan(
            text: 'Privacy Policy',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO go to the Policies Page
                // context.push(policiesPath);
              },
            style: TextStyle(
              color: termsPrivacycolor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
          const TextSpan(text: '.'),
        ],
      ),
    );
  }
}
