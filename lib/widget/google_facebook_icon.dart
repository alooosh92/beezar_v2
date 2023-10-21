import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screen/home/page/home_screen.dart';

class GoogleFacebookIcon extends StatelessWidget {
  const GoogleFacebookIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String google = '''
<svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M29.7083 12.0623H28.5V12H15V18H23.4773C22.2405 21.4928 18.9172 24 15 24C10.0297 24 6 19.9702 6 15C6 10.0297 10.0297 6 15 6C17.2943 6 19.3815 6.8655 20.9708 8.27925L25.2135 4.0365C22.5345 1.53975 18.951 0 15 0C6.71625 0 0 6.71625 0 15C0 23.2838 6.71625 30 15 30C23.2838 30 30 23.2838 30 15C30 13.9943 29.8965 13.0125 29.7083 12.0623Z" fill="#FFC107"/>
<path d="M1.72952 8.01825L6.65777 11.6325C7.99127 8.331 11.2208 6 15 6C17.2943 6 19.3815 6.8655 20.9708 8.27925L25.2135 4.0365C22.5345 1.53975 18.951 0 15 0C9.23852 0 4.24202 3.25275 1.72952 8.01825Z" fill="#FF3D00"/>
<path d="M15 30C18.8745 30 22.395 28.5173 25.0567 26.106L20.4142 22.1775C18.9082 23.3183 17.0362 24 15 24C11.0985 24 7.78574 21.5123 6.53774 18.0405L1.64624 21.8093C4.12874 26.667 9.17024 30 15 30Z" fill="#4CAF50"/>
<path d="M29.7083 12.0623H28.5V12H15V18H23.4773C22.8833 19.6778 21.804 21.1245 20.412 22.1782C20.4127 22.1775 20.4135 22.1775 20.4142 22.1768L25.0568 26.1052C24.7283 26.4037 30 22.5 30 15C30 13.9943 29.8965 13.0125 29.7083 12.0623Z" fill="#1976D2"/>
</svg>
''';
    String facebook = '''
<svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M15 30C23.2843 30 30 23.2843 30 15C30 6.71573 23.2843 0 15 0C6.71573 0 0 6.71573 0 15C0 23.2843 6.71573 30 15 30Z" fill="#7200CB"/>
<path d="M16.166 22.5V15.668H18.4688L18.8145 12.9932H16.166V11.291C16.166 10.5176 16.3799 9.99316 17.4873 9.99316H18.8906V7.6084C18.6475 7.57617 17.8096 7.50293 16.834 7.50293C14.7979 7.50293 13.4033 8.74512 13.4033 11.0273V12.9961H11.1094V15.6709H13.4033V22.5H16.166Z" fill="white"/>
</svg>
''';
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SVGIcon(
              svg: facebook,
              press: () {
                _facebookLogin();
              },
            ),
            SVGIcon(
              svg: google,
              press: () {
                signinGoogle();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SVGIcon extends StatelessWidget {
  const SVGIcon({
    super.key,
    required this.svg,
    required this.press,
  });

  final String svg;
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: SvgPicture.string(
        svg,
        height: 30,
        width: 30,
      ),
    );
  }
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

class GoogleSignInApi {
  static final _googleSignIn = GoogleSignIn();
  static Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
//facebook signin
Future<void> _facebookLogin() async {
  // Create an instance of FacebookLogin
  final fb = FacebookLogin();
  final res = await fb.logIn(permissions: [
    FacebookPermission.publicProfile, //اذن الحصول على البرفايل
    FacebookPermission.email,//اذن الحصول على الايميل
  ]);
  // Check result status
  switch (res.status) {
    case FacebookLoginStatus.success:

      final FacebookAccessToken? accessToken = res.accessToken;// Send access token to server for validation and auth
      final profile = await fb.getUserProfile();// Get profile data
      final imageUrl = await fb.getProfileImageUrl(width: 100);// Get profile img
      final email = await fb.getUserEmail();// get user's email

      print('Access token: ${accessToken?.token}');
      print('Hello, ${profile!.name}! You ID: ${profile.userId}');
      print('Your profile image: $imageUrl');
      if (email != null)
      {
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
