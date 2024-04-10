import '../../wcmcs_exporter.dart';

///* this provides the overall responsiveness of our app
final wcmcsResponsiveProvider =
    Provider.family<WcmcsResponsive, BuildContext>((ref, ctx) {
  return WcmcsResponsive(context: ctx);
});
