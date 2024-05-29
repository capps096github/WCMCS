import '../../../app_exporter.dart';

/// a [ChangeNotifier] class that provides a string [GenderNotifier]
/// mainly used for state management when selecting the user gender
class GenderNotifier extends ChangeNotifier {
  String _gender = '';

  /// currently selected gender by the user
  String get gender => _gender;

  /// set the selected gender by the user
  void setGender({required String genderText}) {
    _gender = genderText;
    notifyListeners();
  }

}

///provides a string [GenderNotifier]
final genderNotifier =
    ChangeNotifierProvider<GenderNotifier>((_) => GenderNotifier());
