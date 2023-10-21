import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.icon,
    required this.press,
    required this.text,
  });
  final void Function() press;
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: (BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              const SizedBox(
                width: 5,
              ),
              Icon(icon),
            ],
          ),
        ),
      ),
    );
  }
}
