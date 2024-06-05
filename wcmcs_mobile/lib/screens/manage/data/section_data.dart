// a list of sections
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/section.dart';

/// initial sections in the app
/// kitchen and washroom
final List<Section> defaultSections = [
  Section(label: 'Kitchen', icon: Icons.fastfood_rounded, litres: 100),
  Section(label: 'Washroom', icon: Icons.bathroom_rounded, litres: 130),
  Section(
    label: 'Living Room',
    icon: CupertinoIcons.rectangle_3_offgrid_fill,
    litres: 125,
  ),
  // garden
  Section(label: 'Garden', icon: Icons.grass_rounded, litres: 121),
];
