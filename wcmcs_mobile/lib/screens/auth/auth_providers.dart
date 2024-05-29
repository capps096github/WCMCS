import '../../app_exporter.dart';

///Current Index of the auth pages
final authPageIndexProvider = StateProvider<int>((_) => 0);

///Sign Up form
final signUpFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Sign In Form
final signInFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

///Forgot form
final forgotFormKeyProvider =
    Provider<GlobalKey<FormState>>((_) => GlobalKey<FormState>());

/// auth error text provider
final authErrorTextProvider = StateProvider<String>((_) => '');
