import '../../app_exporter.dart';
import 'auth_body.dart';

/// This is the Auth Screen
class AuthScreen extends ConsumerWidget {
  /// Authenitcation Screen
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const bacgroundColor = appColor;

    return KeyboardUnfocusWrapper(
      child: Scaffold(
        backgroundColor: bacgroundColor,
        appBar: AppBar(
          backgroundColor: appTransparent,
          automaticallyImplyLeading: false,
          title: const Padding(
            padding: padding8,
            child: AppLogo(),
          ),
        ),
        body: const AuthBody(),
      ),
    );
  }
}
