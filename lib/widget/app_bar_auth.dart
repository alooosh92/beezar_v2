import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appBarAuth(void Function() press, String text, BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: IconButton(
      onPressed: press,
      icon: const Icon(
        Icons.arrow_back_ios,
        color: ColorManager.white,
      ),
    ),
    flexibleSpace: Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SvgPicture.string(
            '''<svg width="390" height="115" viewBox="0 0 390 115" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M-415 90.5L-374.833 78.3191C-334.667 65.9094 -254.333 41.8906 -174 29.4809C-93.6667 17.3 -13.3333 17.3 67 41.7191C147.333 65.9094 227.667 115.091 308 114.919C388.333 115.091 468.667 65.9094 508.833 41.7191L549 17.3V-1H508.833C468.667 -1 388.333 -1 308 -1C227.667 -1 147.333 -1 67 -1C-13.3333 -1 -93.6667 -1 -174 -1C-254.333 -1 -334.667 -1 -374.833 -1H-415V90.5Z" fill="#7200CB"/>
    </svg>
    ''',
            width: MediaQuery.sizeOf(context).width,
          ),
        ),
        Positioned(
          right: 50,
          top: 43,
          child: Text(
            text,
            style: FontDef.w700S28Cw,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    toolbarHeight: 95,
  );
}
