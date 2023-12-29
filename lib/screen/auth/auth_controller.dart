import 'dart:convert';
import 'package:beezer_v2/model/login_user_model.dart';
import 'package:beezer_v2/model/register_user_model.dart';
import 'package:beezer_v2/model/user_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/register/register_screen_one.dart';
import 'package:beezer_v2/screen/home/page/home_screen.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  bool remmberMy = true;
  RegisterUserModel registerUserModel = RegisterUserModel();
  UserModel userModel = UserModel();
  FacebookLogin _facebookLogin = FacebookLogin();
  late bool isLoggedIn;
  Map userData = {};

  void changeRemmberMy() {
    remmberMy = !remmberMy;
    update();
  }

  Future<void> facebookLogin() async {
    FacebookLoginResult result = await _facebookLogin.logIn(permissions: [
      FacebookPermission.email,
      FacebookPermission.publicProfile
    ]);

    if (result.status == FacebookLoginStatus.success) {
      final accessToken = result.accessToken!.token;
      final facebookEmail = await _facebookLogin.getUserEmail();

      http.Response response = await http.post(Hostting.loginGoogle,
          headers: Hostting().getHeader(), body: {"email": facebookEmail});
      if (response.statusCode == 200) {
        final storeg = GetStorage();
        var res = jsonDecode(response.body);
        userModel = UserModel.fromJson(res["user"]);
        storeg.write("token", accessToken);
        storeg.write("MyEmail", userModel.email);
        storeg.write("name", userModel.email);
        storeg.remove("MyPassword");
        return Get.offAll(const HomeScreen());
      } else {
        registerUserModel.email = userModel.email;
        registerUserModel.name = userModel.email;
        return Get.to(const RegisterScreenOne());
      }
    } else {
      Get.snackbar(
        "هناك مشكلة  ",
        "لايمكنك الدخول ",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    }
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
      storeg.write("name", userModel.name);
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
      storeg.write("name", userModel.name);
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

  Future<bool> restPassword(
      {required newPassword,
      required String confirmPassword,
      required String currentPassword}) async {
    http.Response response = await http.put(
      Hostting.updatePasswordUser,
      headers: Hostting().getHeader(),
      body: {
        "new_password": newPassword,
        "confirm_password": confirmPassword,
        "current_password": currentPassword,
      },
    );
    if (response.statusCode == 200) {
      final storeg = GetStorage();
      storeg.write("MyPassword", newPassword);
      return true;
    }
    return false;
  }

  Future<bool> checkToken() async {
    GetStorage storage = GetStorage();
    if (await storage.read("token") != null) {
      http.Response response =
          await http.get(Hostting.getUser, headers: Hostting().getHeader());
      if (response.statusCode == 200) {
        return true;
      }
    }
    return false;
  }

  Future<bool> logout() async {
    http.Response response =
        await http.post(Hostting.logout, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      final storeg = GetStorage();
      storeg.remove("token");
      storeg.remove("name");
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
      var storeg = GetStorage();
      storeg.write("name", user.name);
      storeg.write("MyEmail", user.email);
      return user;
    }
    return null;
  }

  Future<bool> updateUser(UserModel userModel) async {
    http.Response response = await http.post(Hostting.updateUserNew,
        body: userModel.toJson(), headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var storeg = GetStorage();
      storeg.write("name", userModel.name);
      return true;
    }
    return false;
  }

  Future signinGoogle() async {
    try {
      final user = await GoogleSignInApi.login();
      if (user == null) {
        return null;
      } else {
        Get.snackbar(
          "مرحباً بك ",
          "أهلا بك${user.email} بتطبيق بيزار ",
          duration: const Duration(seconds: 3),
          snackPosition: SnackPosition.BOTTOM,
        );
        http.Response response = await http.post(Hostting.loginGoogle,
            headers: Hostting().getHeader(), body: {"email": user.email});
        if (response.statusCode == 200) {
          final storeg = GetStorage();
          var res = jsonDecode(response.body);
          userModel = UserModel.fromJson(res["user"]);
          storeg.write("token", res["token"]);
          storeg.write("MyEmail", userModel.email);
          storeg.write("name", userModel.name);
          storeg.remove("MyPassword");
          return Get.offAll(const HomeScreen());
        } else {
          registerUserModel.email = user.email;
          registerUserModel.name = user.displayName;
          return Get.to(const RegisterScreenOne());
        }
      }
    } catch (e) {
      Get.offAll(const LoginScreen());
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
