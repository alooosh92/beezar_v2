import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/app_bar_item.dart';
import 'package:beezer_v2/screen/item/widget/conttact_buttom_and_favorite.dart';
import 'package:beezer_v2/screen/item/widget/info_user_contact.dart';
import 'package:beezer_v2/screen/item/widget/item_info_and_buttom_scroll.dart';
import 'package:beezer_v2/screen/item/widget/page_builder_image.dart';
import 'package:beezer_v2/screen/item/widget/row_comment.dart';
import 'package:beezer_v2/screen/item/widget/show_commit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemScreen extends StatelessWidget {
  const ItemScreen({super.key, required this.item});
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: appBarItem(),
      body: FutureBuilder(
        future: itemController.getComment(item.id),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                PageBuilderImage(images: item.images!),
                ItemInfoAndButtomScroll(
                  number: item.images!.length,
                  descrption: item.description,
                  name: item.name,
                ),
                InfoUserContact(
                  date: item.date,
                  address: item.address,
                  phone: item.phone,
                  price: item.price.toString(),
                  username: item.username,
                ),
                ConttactButtomAndFavorite(
                  item: item,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [RowComment(item: item, scrollController: scrollController,)],
                ),
                showCommit(context, item.id),
              ],
            ),
          );
        },
      ),
    );
  }
}
