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

  /// get app user from firebase user
  factory AppUser.fromFirebaseUser() {
    final user = FirebaseAuth.instance.currentUser!;

    return AppUser(
      userId: user.uid,
      email: user.email ?? '',
      displayName: user.displayName ?? '',
      joinedOn: Timestamp.now(),
      profilePicUrl: user.photoURL ?? defaultProfilePic,
    );
  }

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

  /// Get the first name of the app user
  String get firstName => displayName.split(' ')[0];

  @override
  String toString() {
    return 'AppUser(userId: $userId, email: $email, displayName: $displayName, joinedOn: $joinedOn, profilePicUrl: $profilePicUrl)';
  }
}
