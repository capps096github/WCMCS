import 'wcmcs_exporter.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // to remove the # from the web url
  usePathUrlStrategy();

  /// this the app home page  here we have what we the main call of the function of the app 
  runApp(
    const ProviderScope(
      child: Wcmcs(),
    ),
  );
}
