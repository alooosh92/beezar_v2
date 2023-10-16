class RegisterUserModel {
  late String? name;
  late String? email;
  late String? phone;
  late String? password;
  late String? address;

  RegisterUserModel(
      {this.email, this.name, this.phone, this.password, this.address});

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
        "address": address
      };
}
