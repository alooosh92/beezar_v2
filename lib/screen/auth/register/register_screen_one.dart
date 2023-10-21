import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/auth/login/login_screen.dart';
import 'package:beezer_v2/screen/auth/login/widget/row_divider_text_divider.dart';
import 'package:beezer_v2/screen/auth/register/register_screen_two.dart';
import 'package:beezer_v2/screen/auth/register/widget/appbar_register.dart';
import 'package:beezer_v2/widget/row_number_screen_register.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/google_facebook_icon.dart';
import 'package:beezer_v2/widget/have_account.dart';
import 'package:beezer_v2/widget/input_decration_def.dart';
import 'package:beezer_v2/widget/list_region.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreenOne extends StatelessWidget {
  const RegisterScreenOne({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final formKay = GlobalKey<FormState>();
    AuthController authController = Get.find();
    TextEditingController name =
        TextEditingController(text: authController.registerUserModel.name);
    TextEditingController email =
        TextEditingController(text: authController.registerUserModel.email);
    TextEditingController phone =
        TextEditingController(text: authController.registerUserModel.phone);

    return Scaffold(
      appBar: appBarRegister(context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKay,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const RowNumberScreenRegister(isScreenOne: true),
                Column(
                  children: [
                    TextFormFieldDeF(
                        label: "الإسم الكامل",
                        controller: name,
                        paddingTop: 10,
                        validator: (val) {
                          return ValidatorDef.validatorname(val);
                        }),
                    TextFormFieldDeF(
                        label: "بريدك الإلكتروني",
                        controller: email,
                        paddingTop: 30,
                        validator: (val) {
                          return ValidatorDef.validatorEmail(val);
                        }),
                    TextFormFieldDeF(
                        label: "رقم الجوال",
                        controller: phone,
                        paddingTop: 30,
                        keyboard: TextInputType.phone,
                        validator: (val) {
                          return ValidatorDef.validatorPhone(val);
                        }),
                    DropdownButtonFormField(
                      padding: const EdgeInsets.only(top: 30),
                      decoration: inputDecorationDef(null, "المحافظة"),
                      isDense: true,
                      borderRadius: BorderRadius.circular(30),
                      value: authController.registerUserModel.address,
                      items: listRegion,
                      validator: (value) => ValidatorDef.validatorRegion(value),
                      style: FontDef.w400S14Cg,
                      onChanged: (value) =>
                          authController.registerUserModel.address = value,
                    )
                  ],
                ),
                Column(
                  children: [
                    ElevatedButtonDef(
                      press: () {
                        if (formKay.currentState!.validate()) {
                          authController.registerUserModel.name = name.text;
                          authController.registerUserModel.phone = phone.text;
                          authController.registerUserModel.email = email.text;
                          Get.to(const RegisterScreenTwo());
                        } else {
                          Get.snackbar("خطأ", "الرجاء ادخال معلومات صحيحة");
                        }
                      },
                      text: "التالي",
                      padding: 30,
                    ),
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
