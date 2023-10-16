import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SVGBottomBar extends StatelessWidget {
  const SVGBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''<svg width="390" height="97" viewBox="0 0 390 97" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0 0L16.5 1.78507C33 3.70486 66 7.07292 99 19.7705C132 32.3333 165 53.8889 198 62.8816C231 71.7396 264 68.3715 297 61.0628C330 53.8889 363 43.1111 379.5 37.7222L396 32.3333V97H379.5C363 97 330 97 297 97C264 97 231 97 198 97C165 97 132 97 99 97C66 97 33 97 16.5 97H0V0Z" fill="#7200CB"/>
</svg>
''',
      width: MediaQuery.sizeOf(context).width,
    );
  }
}
