class UserModel {
  late int? id;
  late String? name;
  late String? email;
  late bool? emailVerifiedAt;
  late String? phone;
  late String? address;
  late String? password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.emailVerifiedAt,
    this.password,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      emailVerifiedAt: json["email_verified_at"],
    );
  }
}
