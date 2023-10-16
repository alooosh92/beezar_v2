import 'package:beezar_v2/res/color_manager.dart';
import 'package:beezar_v2/screen/item/widget/list_commets.dart';
import 'package:beezar_v2/screen/item/widget/text_field_commit.dart';
import 'package:flutter/material.dart';

Future<dynamic> showCommit(BuildContext context, int id) {
  return showDialog(
    useSafeArea: true,
    context: context,
    builder: (context) {
      return Dialog(
        backgroundColor: ColorManager.white,
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(10),
          height: MediaQuery.sizeOf(context).height * 0.6,
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("التعليقات"),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.4,
                child: ListCommets(id: id),
              ),
              TextFieldCommit(
                id: id,
              ),
            ],
          ),
        ),
      );
    },
  );
}
