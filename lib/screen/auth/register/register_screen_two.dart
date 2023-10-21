import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/otp/otp_screen.dart';
import 'package:beezer_v2/screen/auth/register/widget/appbar_register.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenTwo extends StatelessWidget {
  const RegisterScreenTwo({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    AuthController authController = Get.find();
    TextEditingController password =
        TextEditingController(text: authController.registerUserModel.password);
    TextEditingController rePassword =
        TextEditingController(text: authController.registerUserModel.password);
    return Scaffold(
      appBar: appBarRegister(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.8,
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RowNumberScreenRegister(isScreenOne: false),
                Column(
                  children: [
                    TextFormFielPassword(
                      label: "كلمة المرور",
                      controller: password,
                      paddingTop: 30,
                    ),
                    TextFormFielPassword(
                      label: "تأكيد كلمة المرور",
                      controller: rePassword,
                      paddingTop: 30,
                    ),
                  ],
                ),
                ElevatedButtonDef(
                  press: () async {
                    if (formKey.currentState!.validate()) {
                      progressDef();
                      if (password.text == rePassword.text) {
                        authController.registerUserModel.password =
                            password.text;
                        var res = await authController.register();
                        if (res) {
                          Get.to(const OtpScreen());
                        } else {
                          Get.snackbar("خطأ",
                              "تم استخدام البريد الالكتروني مسبقاً او حدث خطأ ما الرجاء الاتصال بالمسوؤل");
                        }
                      } else {
                        Get.snackbar(
                            "خطأ", "لا يوجد تطابق بين كلمة المرور وتأكيدها");
                      }
                    } else {
                      Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                    }
                  },
                  text: "إنشاء حساب",
                  padding: 20,
                ),
                Column(
                  children: [
                    const RowDividerTextDivider(),
                    const GoogleFacebookIcon(),
                    HaveAccount(
                      press: () => Get.off(const LoginScreen()),
                      text: "لديك حساب؟",
                      textPress: "سجل دخول",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
