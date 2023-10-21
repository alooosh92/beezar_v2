import 'dart:convert';
import 'package:beezer_v2/model/login_user_model.dart';
import 'package:beezer_v2/model/register_user_model.dart';
import 'package:beezer_v2/model/user_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  bool remmberMy = true;
  bool? checkUser;
  RegisterUserModel registerUserModel = RegisterUserModel();
  UserModel userModel = UserModel();

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void changeRemmberMy() {
    remmberMy = !remmberMy;
    update();
  }

  Future<bool> login(String email, String password) async {
    LoginUserModel user = LoginUserModel(email: email, password: password);
    http.Response response = await http.post(Hostting.login,
        body: user.toJson(), headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      final storeg = GetStorage();
      var res = jsonDecode(response.body);
      userModel = UserModel.fromJson(res["user"]);
      storeg.write("token", res["token"]);
      if (remmberMy) {
        storeg.write("MyEmail", email);
        storeg.write("MyPassword", password);
      } else {
        storeg.remove("MyEmail");
        storeg.remove("MyPassword");
      }
      return true;
    }
    return false;
  }

  Future<bool> register() async {
    http.Response response = await http.post(Hostting.register,
        body: registerUserModel.toJson(), headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      final storeg = GetStorage();
      var res = jsonDecode(response.body);
      userModel = UserModel.fromJson(res["user"]);
      storeg.write("token", res["token"]);
      if (remmberMy) {
        storeg.write("MyEmail", userModel.email);
        storeg.write("MyPassword", registerUserModel.password);
      }
      return true;
    }
    return false;
  }

  Future<bool> forgetPassword(String email) async {
    return true;
  }

  Future<bool> sendOTP(String value) async {
    return true;
  }

  Future<bool> restPassword(String oldPassword, String newPassword) async {
    return true;
  }

  Future<bool> checkToken() async {
    final storage = GetStorage();
    if (storage.read("token") != null && storage.read("token") != "") {
      http.Response response = await http.post(Hostting.checkTokenValidity,
          headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        checkUser = true;
        return true;
      }
    }
    checkUser = false;
    return false;
  }

  Future<bool> logout() async {
    http.Response response =
        await http.post(Hostting.logout, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      final storeg = GetStorage();
      storeg.remove("token");
      return true;
    }
    return false;
  }

  Future<UserModel?> getUser() async {
    http.Response response =
        await http.get(Hostting.getUser, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var user = UserModel.fromJson(body["data"]);
      return user;
    }
    return null;
  }

  Future<bool> updateUser(UserModel userModel) async {
    http.MultipartRequest request =
        http.MultipartRequest("post", Hostting.updateUser);
    request.headers.addAll(Hostting().getHeader());
    request.fields["name"] = userModel.name!;
    request.fields["email"] = userModel.email!;
    request.fields["address"] = userModel.address!;
    request.fields["phone"] = userModel.phone!;
    request.files.add(await http.MultipartFile.fromPath(
        "image", "lib/assets/images/addToPerson.jpg"));
    var respons = await request.send();
    if (respons.statusCode == 200) {
      return true;
    }
    return false;
  }
}
