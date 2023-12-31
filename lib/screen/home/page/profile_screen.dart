import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/change_password/change_password.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/update_user/profile_edit_screen.dart';
import 'package:beezer_v2/screen/contact_us/contact_us_screen.dart';
import 'package:beezer_v2/screen/home/widget/app_bar_profile.dart';
import 'package:beezer_v2/screen/home/widget/button_add_item.dart';
import 'package:beezer_v2/screen/home/widget/profile_button.dart';
import 'package:beezer_v2/screen/user_policy/usage_policy.dart';
import 'package:beezer_v2/widget/bottom_bar.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _dialog = RatingDialog(
      image: Image.asset(
        'lib/assets/images/logoo 1.png',
        width: 60,
      ),
      title: Text(
        'قيم بيزار',
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorManager.darkPrimaryColor),
      ),
      starSize: 30,
      submitButtonText: 'أرسل',
      commentHint: 'اخبرنا برأيك',
      onCancelled: () => print('cancelled'),
      onSubmitted: (Response) {
        StoreRedirect.redirect(
          androidAppId: 'com.beezar.android',
          iOSAppId: '',
        );
      },
    );

    final storeg = GetStorage();
    return Scaffold(
      floatingActionButton: const ButtonAddItem(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: appBarprofile(context),
      bottomNavigationBar: const BottomNavigationBarDef(),
      body: SizedBox(
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(storeg.read("name"), style: FontDef.w500152Cg),
                  Text(storeg.read("MyEmail"), style: FontDef.w700182Cb),
                  const SizedBox(
                    height: 20,
                  ),
                  ProfileButton(
                    press: () => Get.to(const ProfileEditScreen()),
                    text: "تعديل الصفحة الشخصية",
                    icon: Icons.edit,
                  ),
                  ProfileButton(
                    press: () => Get.to(const ChangePassword()),
                    text: "تعديل كلمة السر",
                    icon: Icons.password_outlined,
                  ),
                  ProfileButton(
                    press: () => Get.to(const ContactUsScreen()),
                    text: "تواصل معنا",
                    icon: Icons.contact_mail_outlined,
                  ),
                  ProfileButton(
                    press: () => Get.to(const UserPolicy(
                      isRegister: false,
                    )),
                    text: "شروط الاستخدام",
                    icon: Icons.policy,
                  ),
                  ProfileButton(
                    press: () => showDialog(
                        context: context, builder: (context) => _dialog),
                    text: "قيم بيزار",
                    icon: Icons.star_border,
                  ),
                  ProfileButton(
                    press: () async {
                      progressDef();
                      AuthController authController = Get.find();
                      var b = await authController.logout();
                      if (b) {
                        Get.offAll(const LoginScreen());
                      }
                    },
                    text: "تسجيل الخروج",
                    icon: Icons.logout,
                  ),
                  ProfileButton(
                    press: () async {
                      var myemail = storeg.read("MyEmail");
                      if (await canLaunchUrl(Uri.parse(
                          "whatsapp://send?phone=905318809686&text=الرجاء حذف حسابي $myemail"))) {
                        launchUrl(Uri.parse(
                            "whatsapp://send?phone=905318809686&text=الرجاء حذف حسابي $myemail"));
                      } else {
                        launchUrl(Uri.parse(
                            "https://wa.me/?phone=905318809686&text=الرجاء حذف حسابي $myemail"));
                      }
                    },
                    text: "طلب حذف الحساب",
                    icon: Icons.delete,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
