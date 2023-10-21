import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/otp/otp_screen.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    AuthController authController = Get.find();
    TextEditingController email = TextEditingController();
    return Scaffold(
      appBar: appBarAuth(() => Get.off(const LoginScreen()), "العودة", context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  "نسيت كلمة المرور؟",
                  style: FontDef.w700S42CP,
                ),
                const Text(
                  "ادخل بريدك الالكتروني لتتلقي رمزا لتوثيقة هنا حتي تتمكن من اعادة تعيين كلمة المرور ",
                  style: FontDef.w500152Cg,
                ),
                TextFormFieldDeF(
                  label: "أدخل بريدك الإكتروني",
                  controller: email,
                  paddingTop: 70,
                  validator: (val) {
                    return ValidatorDef.validatorEmail(val);
                  },
                ),
                ElevatedButtonDef(
                  press: () async {
                    if (formKey.currentState!.validate()) {
                      progressDef();
                      bool sendmessage =
                          await authController.forgetPassword(email.text);
                      if (sendmessage) {
                        Get.to(const OtpScreen());
                      } else {
                        Get.snackbar("خطأ",
                            "هناك خطأ ما قد حدث الرجاء التواصل مع المسؤول");
                      }
                    } else {
                      Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                    }
                  },
                  text: "استمرار",
                  padding: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
