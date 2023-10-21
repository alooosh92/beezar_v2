import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

class RowDividerTextDivider extends StatelessWidget {
  const RowDividerTextDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DividerDef(),
          Text(
            "أو التسجيل عن طريق",
            style: FontDef.w400S13Cb,
          ),
          DividerDef()
        ],
      ),
    );
  }
}

class DividerDef extends StatelessWidget {
  const DividerDef({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(
        height: 25,
        color: ColorManager.black,
        thickness: 1,
        indent: MediaQuery.sizeOf(context).width / 25,
        endIndent: MediaQuery.sizeOf(context).width / 25,
      ),
    );
  }
}
