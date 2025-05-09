import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mealix/shared/authentication/service/firebase_authentication_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mealix/shared/authentication/store/model/user_model.dart';

part 'authentication_provider.g.dart';
part 'authentication_provider.freezed.dart';

@riverpod
Future<User> register(Ref ref) async {
  var result = await FirebaseAuthenticationService().signUp(
    email: 'marcel.wernisch@web.de',
    password: 'test1234',
  );
  return Future.value(
    User(
      id: result.user?.uid ?? '',
      email: result.user?.email ?? '',
      name: result.user?.displayName ?? '',
      photoUrl: result.user?.photoURL ?? '',
    ),
  );
}

enum AuthenticationMode { signIn, signUp }

class AuthenticationFormInput {
  AuthenticationFormInput({this.email, this.password, this.name});

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
    String? email,
    String? password,
    String? name,
  }) {
    return AuthenticationFormInput(
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
    );
  }
}

@freezed
sealed class AuthenticationState with _$AuthenticationState {
  factory AuthenticationState({
    required bool isAuthenticated,
    required AuthenticationMode activeMode,
    User? user,
    required AuthenticationFormInput formInput,
  }) = _AuthenticationState;

  factory AuthenticationState.initial() {
    return AuthenticationState(
      isAuthenticated: false,
      activeMode: AuthenticationMode.signIn,
      formInput: AuthenticationFormInput(),
    );
  }
}

@riverpod
class AuthenticationStore extends _$AuthenticationStore {
  @override
  Future<AuthenticationState> build() async {
    // Initialize the authentication state
    return AuthenticationState.initial();
  }

  void setEMail(String email) {
    print(email);
    final newFormInput =
        state.value?.formInput.copyWith(email: email) ??
        AuthenticationFormInput(email: email);

    state = AsyncData(
      state.value?.copyWith(formInput: newFormInput) ??
          AuthenticationState.initial().copyWith(formInput: newFormInput),
    );
  }

  void setPassword(String password) {
    final newFormInput =
        state.value?.formInput.copyWith(password: password) ??
        AuthenticationFormInput(password: password);

    state = AsyncData(
      state.value?.copyWith(formInput: newFormInput) ??
          AuthenticationState.initial().copyWith(formInput: newFormInput),
    );
  }

  void setName(String name) {
    final newFormInput =
        state.value?.formInput.copyWith(name: name) ??
        AuthenticationFormInput(name: name);

    state = AsyncData(
      state.value?.copyWith(formInput: newFormInput) ??
          AuthenticationState.initial().copyWith(formInput: newFormInput),
    );
  }

  void setLoginMode() {
    state = AsyncData(
      state.value?.copyWith(activeMode: AuthenticationMode.signIn) ??
          AuthenticationState.initial().copyWith(
            formInput: AuthenticationFormInput(),
          ),
    );
  }

  void setSignUpMode() {
    state = AsyncData(
      state.value?.copyWith(activeMode: AuthenticationMode.signUp) ??
          AuthenticationState.initial(),
    );
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    state = const AsyncLoading(); // Show loading state
    try {
      final result = await FirebaseAuthenticationService()
          .logInWithEmailAndPassword(email: email, password: password);

      final authenticatedUser = User.fromFirebaseUser(result);

      state = AsyncData(
        state.value?.copyWith(isAuthenticated: true, user: authenticatedUser) ??
            AuthenticationState.initial().copyWith(
              isAuthenticated: true,
              activeMode: AuthenticationMode.signIn,
              user: authenticatedUser,
              formInput: AuthenticationFormInput(
                email: email,
                password: password,
              ),
            ),
      );
    } catch (e) {
      print(e);
      state = AsyncError(e, StackTrace.current);
    }
  }

  /*Future<void> signOut() async {
    await FirebaseAuthenticationService().signOut();
    state = state.copyWith(isAuthenticated: false);
  }*/
}
