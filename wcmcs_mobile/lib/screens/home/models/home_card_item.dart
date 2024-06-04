import 'package:flutter/foundation.dart';

/// Home card item model
class HomeCardItem {
  /// [HomeCardItem] constructor
  HomeCardItem({
    required this.imageUrl,
    required this.label,
    required this.description,
    this.screenPath ='',
   this.onTap,
  });

  /// imageUrl
  final String imageUrl;

  /// name
  final String label;

  /// description
  final String description;

  /// screenPath
  final String screenPath;

    /// on tap
  final VoidCallback? onTap;
}
