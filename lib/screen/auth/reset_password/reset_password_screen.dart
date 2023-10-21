import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    AuthController authController = Get.find();
    TextEditingController oldPassword = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController rePassword = TextEditingController();
    return Scaffold(
      appBar: appBarAuth(() => Get.off(const LoginScreen()),
          "إعادة تعيين كلمة المرور", context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormFielPassword(
                  label: "كلمة المرور الحالية",
                  controller: oldPassword,
                  paddingTop: 80,
                ),
                TextFormFielPassword(
                  label: "إنشاء كلمة مرور جديدة",
                  controller: password,
                  paddingTop: 20,
                ),
                TextFormFielPassword(
                  label: "تأكيد كلمة المرور",
                  controller: rePassword,
                  paddingTop: 20,
                ),
                ElevatedButtonDef(
                  press: () async {
                    if (formKey.currentState!.validate()) {
                      progressDef();
                      if (password.text != rePassword.text) {
                        var res = await authController.restPassword(
                            oldPassword.text, password.text);
                        if (res) {
                          Get.offAll(const LoginScreen());
                        } else {
                          Get.snackbar("خطأ",
                              "كلمة المرور الحالية غير صحيحة او حدث خطأ ما الرجاء الاتصال بالمسؤول");
                        }
                      } else {
                        Get.snackbar("خطأ",
                            "كلمة المرور الجديدة غير مطابقة لتأكيد كلمة المرور");
                      }
                    } else {
                      Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                    }
                  },
                  text: "تإكيد",
                  padding: 40,
                ),
                HaveAccount(
                    press: () => Get.off(const LoginScreen()),
                    text: "",
                    textPress: "العودة لتسجيل الدخول")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
