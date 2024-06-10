import 'dart:math';

import '../../../app_exporter.dart';

/// the tank model class
class Tank {
  /// the constructor
  Tank({
    required this.height,
    required this.userId,
    this.tankType = 'cylindrical',
     this.radius = 1,
    this.length = 1,
    this.width = 1,
    this.heightOfWaterFlown = 0,
  });

  /// factory from snapshot
  factory Tank.fromSnapshot(DocumentSnapshot<Tank> snapshot) {
    final tank = snapshot.data() ?? Tank.empty();
    return tank;
  }

  /// copy with
  factory Tank.copyWith({
    num? radius,
    num? height,
    num? heightOfWaterFlown,
    String? userId,
    String? tankType,
    num? length,
    num? width,
  }) {
    return Tank(
      radius: radius ?? 0,
      height: height ?? 0,
      heightOfWaterFlown: heightOfWaterFlown ?? 0,
      userId: userId ?? '',
      tankType: tankType ?? 'cylindrical',
      length: length ?? 0,
      width: width ?? 0,
    );
  }

  /// factory, tank.empty
  factory Tank.empty() {
    return Tank(
      height: 1,
      userId: '',
    );
  }

  /// from firestore
  factory Tank.fromFirestore(Map<String, dynamic> map) {
    return Tank(
      radius: map['radius'] as num? ?? 0,
      height: map['height'] as num? ?? 0,
      heightOfWaterFlown: map['heightOfWaterFlown'] as num? ?? 0,
      userId: map['userId'] as String? ?? '',
      tankType: map['type'] as String? ?? '',
      length: map['length'] as num? ?? 0,
      width: map['width'] as num? ?? 0,
    );
  }

  /// tank type, either cylinderical or cuboid
  final String tankType;

  /// the radius of the tank
  final num radius;

  /// the height of the tank
  final num height;

  // * cuboid
  /// the length of the tank
  final num length;

  /// the width of the tank
  final num width;

  /// water flown level
  /// this is the amount of water that has flown out of the tank
  final num heightOfWaterFlown;

  /// user id
  final String userId;

  /// internal method to calculate volume and
  ///takes in height of water flown as parameter
  double volume(num heightOfWaterFlown) {
    return isCylindrical
        ? (pi * radius * radius * heightOfWaterFlown)
        : (length * width * heightOfWaterFlown).toDouble();
  }

  /// getter for tank percentage
  /// obtained from the currentTankVolume / tankCapacity
  double get tankPercentage => currentTankVolume / tankCapacity;

  /// get is cylindrical
  bool get isCylindrical => tankType.toLowerCase() == 'cylindrical';

  /// function that returns a num of tank volume
  /// using formular of a cylinder pi*r^2*h
  double get tankCapacity => volume(height);

  /// get of the current water level
  double get currentWaterLevel => (height - heightOfWaterFlown).toDouble();

  /// current tank volume
  double get currentTankVolume => volume(currentWaterLevel);

  /// to firestore
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'radius': radius})
      ..addAll({'height': height})
      ..addAll({'type': tankType})
      ..addAll({'length': length})
      ..addAll({'width': width})
      ..addAll({'heightOfWaterFlown': heightOfWaterFlown})
      ..addAll({'userId': userId});

    return result;
  }
}
