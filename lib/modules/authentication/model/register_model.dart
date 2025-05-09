class RegisterModel {
  const RegisterModel({
    required this.email,
    required this.password,
    required this.name,
  });
  final String email;
  final String password;
  final String name;

  Map<String, String> toJson() {
    return {'email': email, 'password': password, 'name': name};
  }
}
