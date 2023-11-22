import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/screen/item/widget/list_commets.dart';
import 'package:beezer_v2/screen/item/widget/text_field_commit.dart';
import 'package:flutter/material.dart';

Future<dynamic> showCommit(BuildContext context, int id) {
   return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: ColorManager.white,
        elevation: 4,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.sizeOf(context).height / 2,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                const Text("التعليقات"),
                Expanded(child: ListCommets(id: id)),
                TextFieldCommit(
                  id: id,
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}