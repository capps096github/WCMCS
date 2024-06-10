import '../../app_exporter.dart';

/// snackbar to show after saving results
SnackBar successSnackbar(String message) {
  return SnackBar(
    backgroundColor: appColor,
    margin: const EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Row(
      children: [
        const Icon(
          Icons.check_circle_rounded,
          color: appWhite,
        ),
        const Spacing(of: 10),
        Text(
          message,
          style: const TextStyle(color: appWhite),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: oneSecond,
  );
}

/// error snackbar shown when section is not saved or it exists
SnackBar errorSnackbar(String message) {
  return SnackBar(
    backgroundColor: errorColor,
    margin: const EdgeInsets.all(4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    content: Row(
      children: [
        const Icon(
          Icons.error_outline_rounded,
          color: appWhite,
        ),
        const Spacing(of: 10),
        Text(
          'Section Not Saved - $message',
          style: const TextStyle(color: appWhite),
        ),
      ],
    ),
    behavior: SnackBarBehavior.floating,
    duration: oneSecond,
  );
}
