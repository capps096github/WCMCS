import 'package:flutter/material.dart';

/// a model class for the user's gender, either male or female
class Gender {
  /// [Gender] constructor
  const Gender({
    required this.name,
    required this.icon,
  });

  /// name of the gender e.g Male or Female
  final String name;

  /// icon for this gender
  final IconData icon;
}

/// list of [Gender]s available for selection
final genders = [
  const Gender(
    name: 'Male',
    icon: Icons.male,
  ),
  const Gender(
    name: 'Female',
    icon: Icons.female_outlined,
  ),
];
