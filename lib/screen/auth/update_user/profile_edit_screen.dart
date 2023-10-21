import 'package:beezer_v2/model/user_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/home/widget/drop_down_profile_edit.dart';
import 'package:beezer_v2/screen/home/widget/textfield_profile_edit.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController authController = AuthController();
    TextEditingController myName = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController password = TextEditingController();
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
                    return const ProgressHomeRow();
                  }
                  myName.text = snapshot.data!.name!;
                  phone.text = snapshot.data!.phone!;
                  password.text = user.password ?? "";
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
                      const Row(
                        children: [
                          Text(
                            'الاسم',
                            style: FontDef.w600S17Cb,
                          )
                        ],
                      ),
                      TextFormFieldProfileEdit(
                        keyboard: TextInputType.text,
                        label: 'الاسم',
                        controller: myName,
                        paddingTop: 5,
                        press: (p0) => user.name = p0,
                      ),
                      const Row(
                        children: [
                          Text(
                            'كلمة المرور',
                            style: FontDef.w600S17Cb,
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            'رقم الجوال',
                            style: FontDef.w600S17Cb,
                          )
                        ],
                      ),
                      TextFormFieldProfileEdit(
                        keyboard: TextInputType.phone,
                        label: 'رقم الجوال',
                        controller: phone,
                        paddingTop: 5,
                        press: (p0) => user.phone,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Row(
                        children: [
                          Text(
                            'المدينة',
                            style: FontDef.w600S17Cb,
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          DropdownButtonHideUnderline(
                            child: Container(
                              width: MediaQuery.of(context).size.width * 5,
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: (BoxDecoration(
                                  border:
                                      Border.all(color: ColorManager.grayText),
                                  borderRadius: BorderRadius.circular(10))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropDownProfileEdit(
                                  val: user.address,
                                  press: (p0) => user.address = p0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 40),
                      ElevatedButtonDef(
                        press: () {},
                        text: 'حفط التغييرات',
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
