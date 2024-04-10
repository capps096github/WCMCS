// ignore_for_file: avoid_print, constant_identifier_names, public_member_api_docs

import 'package:flutter/foundation.dart';

/// this function is responsible for printtering the text on the screen
void printer(
  Object? object, {
  bool isDebug = true,
  bool isError = false,
  bool isSuccess = false,
}) {
  /// print the object
  if (kDebugMode) {
    if (isDebug) {
      AppPrinter.printter(object);
    } else if (isError) {
      AppPrinter.printError(object);
    } else if (isSuccess) {
      AppPrinter.printSuccess(object);
    } else {
      print(object);
    }
  }
}

/// this class is responsible for printing the text on the screen with color
class AppPrinter {
  /// Color codes
  static const String ANSI_RESET = '\u001B[0m';
  static const String ANSI_BLACK = '\u001B[30m';
  static const String ANSI_RED = '\u001B[31m';
  static const String ANSI_GREEN = '\u001B[32m';
  static const String ANSI_YELLOW = '\u001B[33m';
  static const String ANSI_BLUE = '\u001B[34m';
  static const String ANSI_PURPLE = '\u001B[35m';
  static const String ANSI_CYAN = '\u001B[36m';
  static const String ANSI_WHITE = '\u001B[37m';

  /// prints the string with a color specified by the user
  static void printError(Object? text) {
    final colorCode = getANSIColorCode('red');
    print(colorCode + text.toString() + ANSI_RESET);
  }

  /// this is for printing without a new line
  static void printter(Object? text) {
    final colorCode = getANSIColorCode('yellow');
    print(colorCode + text.toString() + ANSI_RESET);
  }

  /// this is for printing without a new line
  static void printSuccess(Object? text) {
    final colorCode = getANSIColorCode('green');
    print(colorCode + text.toString() + ANSI_RESET);
  }

  /// returns the color code for the color specified by the user
  static String getANSIColorCode(String color) {
    switch (color.toLowerCase()) {
      case 'black':
        return ANSI_BLACK;
      case 'red':
        return ANSI_RED;
      case 'green':
        return ANSI_GREEN;
      case 'yellow':
        return ANSI_YELLOW;
      case 'blue':
        return ANSI_BLUE;
      case 'purple':
        return ANSI_PURPLE;
      case 'cyan':
        return ANSI_CYAN;
      case 'white':
        return ANSI_WHITE;
      default:
        return ANSI_YELLOW;
    }
  }
}
