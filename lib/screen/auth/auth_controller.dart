import 'dart:convert';
import 'package:beezar_v2/model/login_user_model.dart';
import 'package:beezar_v2/model/register_user_model.dart';
import 'package:beezar_v2/model/user_model.dart';
import 'package:beezar_v2/res/hostting.dart';
import 'package:beezar_v2/screen/home/page/home_screen.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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

  Future signinGoogle() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      Get.snackbar("title", "Nooooooooooooooooooo user ");
    } else {
      Get.snackbar(
        "مرحباً بك ",
        "أهلا بك${user.email} بتطبيق بيزار ",
        duration: const Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
      Get.to(const HomeScreen());
    }
  }

  Future<void> facebookLogin() async {
    // Create an instance of FacebookLogin
    final fb = FacebookLogin();
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile, //اذن الحصول على البرفايل
      FacebookPermission.email, //اذن الحصول على الايميل
    ]);
    // Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken? accessToken = res
            .accessToken; // Send access token to server for validation and auth
        final profile = await fb.getUserProfile(); // Get profile data
        final imageUrl =
            await fb.getProfileImageUrl(width: 100); // Get profile img
        final email = await fb.getUserEmail(); // get user's email

        print('Access token: ${accessToken?.token}');
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');
        print('Your profile image: $imageUrl');
        if (email != null) {
          Get.snackbar(
            "مرحباً بك ",
            "أهلا بك${profile.name} بتطبيق بيزار ",
            duration: const Duration(seconds: 3),
            snackPosition: SnackPosition.TOP,
          );

          Get.to(const HomeScreen());
        } else {
          Get.snackbar("title", "Nooooooooooooooooooo user ");
        }
        print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
        // User cancel log in
        break;
      case FacebookLoginStatus.error:
        // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }
  }
}

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
