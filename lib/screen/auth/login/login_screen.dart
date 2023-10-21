import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/forgit_password/forget_password_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_remmber_me_and_forget_password.dart';
import 'package:beezer_v2/screen/auth/login/widget/svg_bottom_bar.dart';
import 'package:beezer_v2/screen/home/primer_screen.dart';
import 'package:beezer_v2/screen/user_policy/usage_policy.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    var storeg = GetStorage();
    TextEditingController email =
        TextEditingController(text: storeg.read("MyEmail"));
    TextEditingController password =
        TextEditingController(text: storeg.read("MyPassword"));
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      bottomNavigationBar: const SVGBottomBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 60, left: 30, right: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "تسجيل الدخول",
                  style: FontDef.w700S28CP,
                ),
                const Text(
                  "مرجباً بك في بيزار",
                  style: FontDef.w600S18Cg,
                ),
                Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextFormFieldDeF(
                        controller: email,
                        label: "البريد الإلكتروني",
                        paddingTop: 50,
                        validator: (p0) {
                          return ValidatorDef.validatorEmail(p0);
                        },
                      ),
                      TextFormFielPassword(
                        controller: password,
                        label: "كلمة المرور",
                        paddingTop: 30,
                      ),
                      RowRemmberMeAndForgetPassword(
                        pressForget: () => Get.to(const ForgetPasswordScreen()),
                      ),
                      ElevatedButtonDef(
                        press: () async {
                          if (formKey.currentState!.validate()) {
                            progressDef();
                            var res = await authController.login(
                                email.text, password.text);
                            if (res) {
                              Get.offAll(const PrimerScreen());
                            } else {
                              Get.snackbar("خطأ",
                                  "تم ادخال اسم المستخدم او كلمة المرور بشكل خاطئ");
                            }
                          } else {
                            Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                          }
                        },
                        text: "تسجيل دخول",
                      ),
                      const RowDividerTextDivider(),
                      const GoogleFacebookIcon(),
                      HaveAccount(
                        press: () =>
                            Get.off(const UserPolicy(isRegister: true)),
                        text: "ليس لديك حساب؟",
                        textPress: "إنشاء حساب",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
