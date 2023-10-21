import 'package:beezer_v2/res/color_manager.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key, required this.press});
  final void Function() press;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: press,
      icon: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorManager.litePrimaryColor,
        ),
        child: const Icon(Icons.favorite_border_outlined,
            color: ColorManager.primaryColor),
      ),
    );
  }
}
