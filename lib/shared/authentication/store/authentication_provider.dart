import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../modules/authentication/model/register_model.dart';
import '../service/firebase_authentication_service.dart';
import 'model/user_model.dart';

part 'authentication_provider.freezed.dart';
part 'authentication_provider.g.dart';

enum AuthenticationMode { signIn, signUp }

class AuthenticationFormInput {
  AuthenticationFormInput({
    required this.activeMode,
    this.email,
    this.password,
    this.name,
  });

  final AuthenticationMode activeMode;
  final String? email;
  final String? password;
  final String? name;

  bool isValid(AuthenticationMode mode) {
    if (mode == AuthenticationMode.signIn) {
      return email != null && password != null;
    } else if (mode == AuthenticationMode.signUp) {
      return email != null && password != null && name != null;
    }
    throw Exception('Invalid authentication mode');
  }

  AuthenticationFormInput copyWith({
    AuthenticationMode? activeMode,
    String? email,
    String? password,
    String? name,
  }) {
    return AuthenticationFormInput(
      activeMode: activeMode ?? this.activeMode,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}

@riverpod
class AuthenticationFormState extends _$AuthenticationFormState {
  @override
  AuthenticationFormInput build() {
    return AuthenticationFormInput(activeMode: AuthenticationMode.signIn);
  }

  void setEmail(String email) {
    state = state.copyWith(email: email.isEmpty ? null : email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password.isEmpty ? null : password);
  }

  void setName(String name) {
    state = state.copyWith(name: name.isEmpty ? null : name);
  }

  void setLoginMode() {
    state = state.copyWith(activeMode: AuthenticationMode.signIn);
  }

  void setSignUpMode() {
    state = state.copyWith(activeMode: AuthenticationMode.signUp);
  }
}

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({required bool isAuthenticated, User? user}) =
      _AuthenticationState;

  factory AuthenticationState.initial() {
    return AuthenticationState(isAuthenticated: false);
  }
}

@riverpod
class AuthenticationStore extends _$AuthenticationStore {
  @override
  Future<AuthenticationState> build() async {
    // Initialize the authentication state
    return AuthenticationState.initial();
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading(); // Show loading state
    try {
      final result = await FirebaseAuthenticationService()
          .logInWithEmailAndPassword(email: email, password: password);

      final authenticatedUser = User.fromFirebaseUser(result);
      print(authenticatedUser);
      state = AsyncData(
        state.value?.copyWith(isAuthenticated: true, user: authenticatedUser) ??
            AuthenticationState.initial().copyWith(
              isAuthenticated: true,
              user: authenticatedUser,
            ),
      );
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }

  Future<void> register(RegisterModel registerModel) async {
    state = const AsyncLoading(); // Show loading state

    final result = await FirebaseAuthenticationService().signUp(
      email: registerModel.email,
      password: registerModel.password,
    );

    await result.user?.updateDisplayName(registerModel.name);
    // FIXME: The reload don't affect the user object in this method
    await result.user?.reload();

    final authenticatedUser = User.fromFirebaseUser(result);
    state = AsyncData(
      state.value?.copyWith(isAuthenticated: true, user: authenticatedUser) ??
          AuthenticationState.initial().copyWith(
            isAuthenticated: true,
            user: authenticatedUser,
          ),
    );
  }
}
