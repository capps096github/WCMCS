import '../../app_exporter.dart';

///* this provides the overall responsiveness of our app
final appResponsiveProvider =
    Provider.family<AppResponsive, BuildContext>((ref, ctx) {
  return AppResponsive(context: ctx);
});
