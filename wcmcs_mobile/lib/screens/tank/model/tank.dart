/// the tank model class
class Tank {
  /// the constructor
  Tank({
    required this.radius,
    required this.height,
    required this.userId,
    this.heightOfWaterFlown = 0,
  });

  /// copy with
  factory Tank.copyWith({
    num? radius,
    num? height,
    num? heightOfWaterFlown,
    String? userId,
  }) {
    return Tank(
      radius: radius ?? 0,
      height: height ?? 0,
      heightOfWaterFlown: heightOfWaterFlown ?? 0,
      userId: userId ?? '',
    );
  }

  /// factory, tank.empty
  factory Tank.empty() {
    return Tank(
      radius: 0,
      height: 0,
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
    );
  }

  /// the radius of the tank
  final num radius;

  /// the height of the tank
  final num height;

  /// water flown level
  /// this is the amount of water that has flown out of the tank
  final num heightOfWaterFlown;

  /// user id
  final String userId;

  /// function that returns a num of tank volume
  /// using formular of a cylinder pi*r^2*h
  double get originalTankVolume => (22 / 7) * radius * radius * height;

  /// get of the current water level
  double get currentWaterLevel => (height - heightOfWaterFlown).toDouble();

  /// current tank volume
  double get currentTankVolume =>
      (22 / 7) * radius * radius * currentWaterLevel;

  /// to firestore
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'radius': radius})
      ..addAll({'height': height})
      ..addAll({'heightOfWaterFlown': heightOfWaterFlown})
      ..addAll({'userId': userId});

    return result;
  }
}
