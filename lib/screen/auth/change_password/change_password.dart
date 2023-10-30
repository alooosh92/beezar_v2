import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/home/page/profile_screen.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:beezer_v2/widget/text_form_field_password_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController repassword = TextEditingController();
    final keyForm = GlobalKey<FormState>();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: FutureBuilder(
                future: authController.getUser(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        child: const ProgressHomeRow());
                  }
                  return Form(
                    key: keyForm,
                    autovalidateMode: AutovalidateMode.always,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(snapshot.data!.email!, style: FontDef.w500152Cg),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormFielPassword(
                          label: ' كلمة السر الحالية',
                          controller: oldPassword,
                          paddingTop: 20,
                        ),
                        TextFormFielPassword(
                          label: 'كلمة السر الجديدة',
                          controller: newPassword,
                          paddingTop: 20,
                        ),
                        TextFormFielPassword(
                          label: 'تأكيد كلمة السر الجديدة',
                          controller: repassword,
                          paddingTop: 20,
                        ),
                        const SizedBox(height: 40),
                        ElevatedButtonDef(
                          press: () async {
                            if (keyForm.currentState!.validate()) {
                              if (newPassword.text == repassword.text) {
                                progressDef();
                                var b = await authController.restPassword(
                                  confirmPassword: repassword.text,
                                  currentPassword: oldPassword.text,
                                  newPassword: newPassword.text,
                                );
                                if (b) {
                                  Get.back();
                                  Get.to(const ProfileScreen());
                                  Get.snackbar(
                                      "ملاحظة", "تم تعديل كلمة السر بنجاح",
                                      backgroundColor:
                                          ColorManager.primaryColor,
                                      colorText: ColorManager.white);
                                } else {
                                  Get.back();
                                  Get.snackbar("تحذير", "هناك خطا ما",
                                      backgroundColor:
                                          ColorManager.primaryColor,
                                      colorText: ColorManager.white);
                                }
                              } else {
                                Get.snackbar("خطأ",
                                    "كلمة السر غير مطابقة لتاكيد كلمة السر",
                                    backgroundColor: ColorManager.primaryColor,
                                    colorText: ColorManager.white);
                              }
                            }
                          },
                          text: 'تعديل كلمة السر',
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
