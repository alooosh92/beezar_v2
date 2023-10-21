import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowRemmberMeAndForgetPassword extends StatelessWidget {
  const RowRemmberMeAndForgetPassword({
    super.key,
    required this.pressForget,
  });
  final void Function() pressForget;

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GetBuilder<AuthController>(
                init: authController,
                builder: (controller) => Checkbox(
                  value: controller.remmberMy,
                  activeColor: ColorManager.darkPrimaryColor,
                  checkColor: ColorManager.white,
                  onChanged: (value) => controller.changeRemmberMy(),
                ),
              ),
              const Text("تذكرني", style: FontDef.w700S12Cb),
            ],
          ),
          TextButton(
              onPressed: pressForget,
              child: const Text(
                "نسيت كلمة المرور؟",
                style: FontDef.w700S12Cb,
              ))
        ],
      ),
    );
  }
}
