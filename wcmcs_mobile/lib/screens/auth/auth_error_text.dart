import '../../app_exporter.dart';

/// This is the error text that will be displayed in a red container incase of an error
class AuthErrorText extends ConsumerWidget {
  /// [AuthErrorText] constructor
  const AuthErrorText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final errorText = ref.watch(authErrorTextProvider);

    /// is empty signifies no error
    final isNoError = errorText.isEmpty;

    /// this is the error text that will be displayed in a red transparent like container
    return AnimatedOpacity(
      opacity: isNoError ? 0 : 1,
      duration: halfSeconds,
      child: AnimatedContainer(
        duration: halfSeconds,
        height: isNoError ? 0 : null,
        decoration: const BoxDecoration(
          color: errorColor,
          borderRadius: borderRadius8,
        ),
        padding: EdgeInsets.symmetric(
          vertical: isNoError ? 0 : spacing16,
        ),
        child: Text(
          errorText,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: appWhite,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
