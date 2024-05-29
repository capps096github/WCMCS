import 'package:flutter_riverpod/flutter_riverpod.dart';

///Email provider
final emailProvider = StateProvider<String>((ref) => '');

///Forgot Email provider
final forgotEmailProvider = StateProvider<String>((ref) => '');

///Name provider
final nameProvider = StateProvider<String>((ref) => '');

///Password provider
final passwordProvider = StateProvider<String>((ref) => '');
