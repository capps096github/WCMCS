
import 'package:flutter/material.dart';

import 'dart:math' as math;

// wcmcs Color
const wcmcsColor = Color(0xFF007BFF);

// wcmcs secondary color
const wcmcsSecondaryColor = Color(0xFFE2E2E2);

// wcmcs background
const wcmcsBackground = Color(0xFF200E32);

// wcmcs white
const wcmcsWhite = Color(0xFFFFFFFF);

// wcmcs black
const wcmcsBlack = Color(0xFF000000);

// wcmcs transparent
const wcmcsTransparent = Colors.transparent;

// wcmcs random color
Color get wcmcsRandomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1.0);

