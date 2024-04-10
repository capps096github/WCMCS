import 'package:flutter/gestures.dart';

import '../../wcmcs_exporter.dart';

class WcmcsDisclaimer extends StatelessWidget {
  const WcmcsDisclaimer({super.key,
  this.continuingColor = wcmcsColor,
    this.termsPrivacycolor = wcmcsSecondaryColor,
  });

  final Color continuingColor;
  final Color termsPrivacycolor;

  @override
  Widget build(BuildContext context) {
   
   return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By continuing, you declare that you accept The Calcut\n',
        style: TextStyle(color: continuingColor),
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
