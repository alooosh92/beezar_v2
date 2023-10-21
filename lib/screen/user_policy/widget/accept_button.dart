import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/auth/register/register_screen_one.dart';
import 'package:beezer_v2/widget/elevated_button_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AcceptButton extends StatefulWidget {
  const AcceptButton({
    super.key,
    required this.isRegister,
  });
  final bool isRegister;

  @override
  State<AcceptButton> createState() => _AcceptButtonState();
}

bool _check = false;

class _AcceptButtonState extends State<AcceptButton> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.isRegister,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                activeColor: ColorManager.primaryColor,
                value: _check,
                onChanged: (newBool) {
                  setState(() {
                    _check = newBool!;
                  });
                },
              ),
              const Text(
                'موافق على سياسة الاستخدام',
                style: FontDef.w400S15Cb,
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButtonDef(
            press: () {
              if (_check) {
                Get.off(const RegisterScreenOne());
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        'يجب الموافقة على سياسة الاستخدام',
                      ),
                      content: const Text(
                          'لإكمال التسجيل يجب الموافقة على سياسة الاستخدام'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('موافق'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            text: 'استمرار',
          )
        ],
      ),
    );
  }
}
