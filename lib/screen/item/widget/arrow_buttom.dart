import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowButtom extends StatelessWidget {
  const ArrowButtom({super.key, required this.isleft, required this.show});
  final bool isleft;
  final bool show;
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return Visibility(
      visible: show,
      child: InkWell(
        onTap: () {
          if (isleft) {
            itemController.pageController.nextPage(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn);
          } else {
            itemController.pageController.previousPage(
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn);
          }
        },
        child: Container(
          height: 90,
          width: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: !isleft
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
              topLeft: !isleft
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
              bottomRight:
                  isleft ? const Radius.circular(0) : const Radius.circular(20),
              topRight:
                  isleft ? const Radius.circular(0) : const Radius.circular(20),
            ),
            color: ColorManager.black,
          ),
          child: Icon(
            isleft
                ? Icons.keyboard_double_arrow_right_rounded
                : Icons.keyboard_double_arrow_left_rounded,
            color: ColorManager.white,
          ),
        ),
      ),
    );
  }
}
