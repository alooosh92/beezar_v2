import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    toolbarHeight: 140,
    actions: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/tr-logo.png',
                  width: 100,
                ),
                const Column(
                  children: [
                    Center(
                      child: Text(
                        "سياسة استخدام التطبيق ",
                        style: FontDef.w700182Cb,
                      ),
                    ),
                    Text(
                      "لبيع المستعمل ",
                      style: FontDef.w700182Cb,
                    )
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                color: ColorManager.black,
                thickness: 1,
              ),
            ),
          ],
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
