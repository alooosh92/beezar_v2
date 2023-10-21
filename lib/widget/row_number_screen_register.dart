import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowNumberScreenRegister extends StatelessWidget {
  const RowNumberScreenRegister({
    super.key,
    required this.isScreenOne,
  });
  final bool isScreenOne;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Center(
            child: Text("1", style: FontDef.w700S16Cw),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: isScreenOne
                ? ColorManager.litePrimaryColor
                : ColorManager.primaryColor,
            borderRadius: BorderRadius.circular(40),
          ),
          child: const Center(
            child: Text("2", style: FontDef.w700S16Cw),
          ),
        ),
      ],
    );
  }
}
