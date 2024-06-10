import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';

/// tank type
class TankType {
  /// constructor
  TankType({
    required this.name,
    required this.icon,
  });

  /// empty tank type
  factory TankType.empty() {
    return TankType(
      name: '',
      icon: Icons.error,
    );
  }

  /// name
  final String name;

  /// icon
  final IconData icon;

  /// get label is name is lowercase
  String get label => name.toLowerCase();

  /// is cylindrical
  bool get isCylindrical => label == 'cylindrical';
}

/// cylindrical tank type
final cylindricalTankType = TankType(
  name: 'Cylindrical',
  icon: CupertinoIcons.capsule_fill,
);

/// cuboid tank type
final cuboidTankType = TankType(
  name: 'Cuboid',
  icon: CupertinoIcons.cube_box_fill,
);
