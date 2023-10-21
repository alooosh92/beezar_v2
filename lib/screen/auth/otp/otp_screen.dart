import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/home/primer_screen.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String otpval = "";
    AuthController authController = Get.find();
    return Scaffold(
      appBar: appBarAuth(() => Get.back(), "العودة", context),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("ادخل 6 رموز", style: FontDef.w700182Cb),
                ],
              ),
              const Text(
                "يجب أن يصل الرمز المكون من ست أرقام إلى بريدك الإلكتروني الذي ادخلته",
                style: FontDef.w500S13Cg,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: OtpTextField(
                  keyboardType: TextInputType.number,
                  numberOfFields: 6,
                  autoFocus: true,
                  borderWidth: 2,
                  showFieldAsBox: true,
                  fieldWidth: 45,
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  onSubmit: (value) => otpval = value,
                ),
              ),
              ElevatedButtonDef(
                press: () async {
                  if (otpval.length == 6) {
                    progressDef();
                    var res = await authController.sendOTP(otpval);
                    if (res) {
                      Get.offAll(const PrimerScreen());
                    } else {
                      Get.snackbar("خطأ", "تم ادخال رمز خاطئ");
                    }
                  } else {
                    Get.snackbar("خطأ", "الرجاء ادخال الرمز بطريقة صحيح");
                  }
                },
                text: "إرسال",
                padding: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
