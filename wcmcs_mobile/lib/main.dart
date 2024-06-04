// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'app_exporter.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to remove the # from the web url
  usePathUrlStrategy();

    /// disable firebase initialization oon windows
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// this the app home page  here we have what we the main call of the function of the app
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}


// #define USER_EMAIL "test@wcmcs.com"
// #define USER_PASSWORD "Test@WCMCS096"


// Testing credentials
// brian@wcmcs.com
// Test@WCMCS096
