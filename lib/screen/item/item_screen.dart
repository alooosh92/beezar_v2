import 'package:beezar_v2/model/item_model.dart';
import 'package:beezar_v2/res/color_manager.dart';
import 'package:beezar_v2/res/font_def.dart';
import 'package:beezar_v2/screen/item/widget/app_bar_item.dart';
import 'package:beezar_v2/screen/item/widget/conttact_buttom_and_favorite.dart';
import 'package:beezar_v2/screen/item/widget/info_user_contact.dart';
import 'package:beezar_v2/screen/item/widget/item_info_and_buttom_scroll.dart';
import 'package:beezar_v2/screen/item/widget/page_builder_image.dart';
import 'package:beezar_v2/screen/item/widget/show_commit.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.item});
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarItem(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PageBuilderImage(images: item.images!),
            ItemInfoAndButtomScroll(
              number: item.images!.length,
              descrption: item.description,
              name: item.name,
            ),
            InfoUserContact(
              address: item.address,
              phone: item.phone,
              price: item.price.toString(),
              username: item.username,
            ),
            ConttactButtomAndFavorite(
              item: item,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                    onPressed: () {
                      showCommit(context, item.id);
                    },
                    icon: const Icon(
                      Icons.comment,
                      color: ColorManager.grayText,
                    ),
                    label: const Text(
                      "التعليقات",
                      style: FontDef.w400S16Cg,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
