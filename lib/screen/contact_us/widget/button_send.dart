import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class ButtonSend extends StatelessWidget {
  const ButtonSend({super.key, required this.press, required this.hint});
  final void Function() press;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: press,
        style: const ButtonStyle(
            fixedSize: MaterialStatePropertyAll(Size(250, 40)),
            backgroundColor:
                MaterialStatePropertyAll(ColorManager.primaryColor)),
        child: Text(hint),
      ),
    );
  }
}
