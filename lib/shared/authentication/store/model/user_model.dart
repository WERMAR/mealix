import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
sealed class User with _$User {
  factory User({
    required String id,
    required String email,
    required String name,
    required String photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  factory User.fromFirebaseUser(UserCredential userCredential) {
    final user = userCredential.user;
    return User(
      id: user?.uid ?? '',
      email: user?.email ?? '',
      name: user?.displayName ?? '',
      photoUrl: user?.photoURL ?? '',
    );
  }
}
