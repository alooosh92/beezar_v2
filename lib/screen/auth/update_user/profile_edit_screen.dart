import 'package:beezer_v2/model/user_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/validator_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/input_decration_def.dart';
import 'package:beezer_v2/widget/list_region.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:beezer_v2/widget/text_form_field_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    TextEditingController myName = TextEditingController();
    TextEditingController phone = TextEditingController();
    UserModel user = UserModel();
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
                  myName.text = snapshot.data!.name!;
                  phone.text = snapshot.data!.phone!;
                  user = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(snapshot.data!.email!, style: FontDef.w500152Cg),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormFieldDeF(
                        keyboard: TextInputType.text,
                        label: 'الاسم',
                        controller: myName,
                        paddingTop: 20,
                        press: (p0) => user.name = p0,
                      ),
                      TextFormFieldDeF(
                        keyboard: TextInputType.phone,
                        label: 'رقم الجوال',
                        controller: phone,
                        paddingTop: 20,
                        press: (p0) => user.phone = p0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonFormField(
                            padding: const EdgeInsets.only(top: 30),
                            decoration: inputDecorationDef(null, "المحافظة"),
                            isDense: true,
                            borderRadius: BorderRadius.circular(30),
                            value: user.address,
                            items: listRegion,
                            validator: (value) =>
                                ValidatorDef.validatorRegion(value),
                            style: FontDef.w400S14Cg,
                            onChanged: (value) => user.address = value,
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButtonDef(
                        press: () async {
                          progressDef();
                          var b = await authController.updateUser(user);
                          if (b) {
                            Get.back();
                            Get.snackbar("ملاحظة", "تم تعديل البيانات بنجاح",
                                backgroundColor: ColorManager.primaryColor,
                                colorText: ColorManager.white);
                          } else {
                            Get.back();
                            Get.snackbar("تحذير", "هناك خطا ما",
                                backgroundColor: ColorManager.primaryColor,
                                colorText: ColorManager.white);
                          }
                        },
                        text: 'حفظ التغييرات',
                      )
                    ],
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
