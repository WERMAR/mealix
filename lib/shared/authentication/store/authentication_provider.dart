import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

import '../../../modules/authentication/model/register_model.dart';
import '../service/firebase_authentication_service.dart';
import 'model/user_model.dart';
import 'package:mealix/modules/home/store/household_provider.dart';
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
  FutureOr<AuthenticationState> build() async {
    final user = fb_auth.FirebaseAuth.instance.currentUser;
    return AuthenticationState(isAuthenticated: user != null);
  }

  Future<void> logout() async {
    await fb_auth.FirebaseAuth.instance.signOut();

    // Clear household name
    ref.read(householdNameProvider.notifier).clear();

    // Clear auth state
    state = AsyncValue.data(AuthenticationState(isAuthenticated: false));
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading(); // Show loading state

    try {
      final result = await FirebaseAuthenticationService()
          .logInWithEmailAndPassword(email: email, password: password);

      final authenticatedUser = User.fromFirebaseUser(result);

      // Update authentication state
      state = AsyncData(
        state.value?.copyWith(isAuthenticated: true, user: authenticatedUser) ??
            AuthenticationState.initial().copyWith(
              isAuthenticated: true,
              user: authenticatedUser,
            ),
      );

      // Added for logout/login feature
      await loadCurrentUserHousehold(ref);

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