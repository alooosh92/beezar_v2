class LoginUserModel {
  late String email;
  late String password;

  LoginUserModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {"email": email, "password": password};
}
