import 'package:flutter/foundation.dart';

/// check if the current platform is Windows
final bool isWcmcsWindows = (defaultTargetPlatform == TargetPlatform.windows);

/// check if the current platform is Windows
final bool isWcmcsAndroid = (defaultTargetPlatform == TargetPlatform.android);

/// check if the current platform is Windows
final bool isWcmcsiOs = (defaultTargetPlatform == TargetPlatform.iOS);

/// check if the current platform is Windows or Web
const bool isAppWeb = kIsWeb;

/// check if the current platform is Windows or Web
final bool isWcmcsWebOrWindows = isWcmcsWindows || isAppWeb;

///This variable declares that if we are on phone
///, no mouse region, else we gat a mouse region
final isPhone = isWcmcsAndroid || isWcmcsiOs;
