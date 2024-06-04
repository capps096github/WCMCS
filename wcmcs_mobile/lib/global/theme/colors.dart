import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';

/// wcmcs Color
const appColor = Color(0xFF007BFF);

/// wcmcs secondary color
const appNavy = Color(0xFF000525);
// const wcmcsSecondaryColor = Color(0xFFE2E2E2);

/// app black
const appBlack = Color(0xFF000000);

/// wcmcs background
// const wcmcsBackground = Color(0xFF200E32);
const appBackground = Color(0xFFEDF1F4);

/// wcmcs white
const appWhite = Color(0xFFFFFFFF);

/// wcmcs black
const wcmcsBlack = Color(0xFF000000);

// green
/// green
const appGreen = Color(0xFF228B22);

/// wcmcs transparent
const appTransparent = Colors.transparent;

/// wcmcs random color
Color get wcmcsRandomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1);

/// * Text Colors all colors in this file
final List<Color> allCardColors = [
  appBlack,
  const Color(0xFFB30000),
  appColor,
  appGreen,
  const Color(0xFFF8074B),
  const Color(0xFFFF6F00),
];

/// ! ----------- errors
/// error yellow
const errorYellow = Color(0xFFFFFF00);

/// error color
const errorColor = Color(0xFF8A0301);
