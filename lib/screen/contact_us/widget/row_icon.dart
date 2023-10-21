import 'package:beezer_v2/screen/contact_us/widget/icon_button_def.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RowIcon extends StatelessWidget {
  const RowIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButtonDef(
          icon: FontAwesomeIcons.facebook,
          url:
              'https://www.facebook.com/profile.php?id=100095002767101&mibextid=ZbWKwL',
        ),
        IconButtonDef(
          icon: FontAwesomeIcons.linkedin,
          url: 'https://www.linkedin.com/company/96034466/admin/feed/posts/',
        ),
        IconButtonDef(
          icon: FontAwesomeIcons.phone,
          url: 'tel:00905347784520',
        ),
        IconButtonDef(
          icon: FontAwesomeIcons.earthAfrica,
          url: 'https://arg-tr.com/',
        ),
      ],
    );
  }
}
