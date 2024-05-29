import 'package:flutter/material.dart';

/// This is a widget that unfocuses the keyboard when child tapped
class KeyboardUnfocusWrapper extends StatelessWidget {
  /// This is a widget that unfocuses the keyboard when child tapped
  const KeyboardUnfocusWrapper({required this.child, super.key});

  /// child
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: child,
    );
  }
}
