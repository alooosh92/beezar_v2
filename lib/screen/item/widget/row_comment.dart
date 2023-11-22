import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/item/widget/show_commit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowComment extends StatelessWidget {
  const RowComment({
    super.key,
    required this.item,
    
  });

  final ItemModel item;
 
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return TextButton(
      onPressed: () {
        showCommit(context, item.id);
      
      },
      
      child: Row(
        children: [
          GetX<ItemController>(
            init: itemController,
            builder: (controller) => Text(
              "(${controller.listComment.length}) التعليقات",
              style: FontDef.w400S16Cg,
            ),
          ),
             Image.asset('lib/assets/images/icons8-comment.gif', width: 40,),
        ],
      ),
    );
  }
}
