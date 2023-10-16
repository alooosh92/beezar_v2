import 'package:beezar_v2/model/comments.dart';
import 'package:beezar_v2/res/font_def.dart';
import 'package:beezar_v2/screen/item/item_controller.dart';
import 'package:beezar_v2/screen/item/widget/commit_def.dart';
import 'package:beezar_v2/widget/progress_home_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListCommets extends StatelessWidget {
  const ListCommets({
    super.key,
    required this.id,
  });
  final int id;
  @override
  Widget build(BuildContext context) {
    ItemController itemController = Get.find();
    return FutureBuilder<List<CommentModel>>(
      future: itemController.getComment(id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const ProgressHomeRow();
        }
        if (snapshot.data!.isEmpty) {
          return const Center(
            child: Text(
              "كن اول المعلقين على هذا الإعلان",
              style: FontDef.w500S13Cg,
            ),
          );
        }
        return GetBuilder<ItemController>(
          init: itemController,
          builder: (controller) => ListView.builder(
            itemCount: controller.listComment.length,
            itemBuilder: (context, index) {
              return CommitDef(
                itemId: controller.listComment[index].itemId!,
                comment: controller.listComment[index].comment!,
                date: controller.listComment[index].date!,
                name: controller.listComment[index].username!,
                id: controller.listComment[index].id!,
              );
            },
          ),
        );
      },
    );
  }
}
