import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../wcmcs_exporter.dart';
import '../level/water_levels.dart';
import '../tips/tips.dart';

class WcmcsHome extends StatelessWidget {
  const WcmcsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  const WaterLevels();
  }
}