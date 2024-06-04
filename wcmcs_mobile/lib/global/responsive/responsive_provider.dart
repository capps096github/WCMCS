// ignore_for_file: avoid_build_context_in_providers
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../app_exporter.dart';

part 'responsive_provider.g.dart';

/// This is the App Responsive Provider
@riverpod
AppResponsive appResponsive(AppResponsiveRef ref, BuildContext context) {
  return AppResponsive(context: context);
}
