import '../../app_exporter.dart';

/// this is the current user of the app
class AppUser {
  /// App user
  AppUser({
    required this.userId,
    required this.email,
    required this.displayName,
    required this.joinedOn,
    this.profilePicUrl = defaultProfilePic,
  });

  /// from firestore
  factory AppUser.fromFirestore(Map<String, dynamic> map) {
    return AppUser(
      userId: map['userId'] as String? ?? '',
      email: map['email'] as String? ?? '',
      displayName: map['displayName'] as String? ?? '',
      joinedOn: map['joinedOn'] as Timestamp? ?? Timestamp.now(),
      profilePicUrl: map['profilePicUrl'] as String? ?? '',
    );
  }

  /// user id
  final String userId;

  /// email
  final String email;

  /// name
  final String displayName;

  /// timestamp: joined Calcut on
  final Timestamp joinedOn;

  /// profile pic
  final String profilePicUrl;

  /// to json
  Map<String, dynamic> toFirestore() {
    final result = <String, dynamic>{}
      ..addAll({'userId': userId})
      ..addAll({'email': email})
      ..addAll({'displayName': displayName})
      ..addAll({'joinedOn': joinedOn})
      ..addAll({'profilePicUrl': profilePicUrl});

    return result;
  }

  /// defaultUser
  static AppUser defaultUser = AppUser(
    userId: '',
    email: '',
    displayName: '',
    joinedOn: Timestamp.now(),
  );
}
