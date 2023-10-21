import 'package:beezer_v2/model/item_model.dart';
import 'package:beezer_v2/res/color_manager.dart';
import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ItemInFavorite extends StatelessWidget {
  const ItemInFavorite({
    super.key,
    required this.item,
    required this.pressDelete,
    required this.pressContact,
    required this.pressItem,
    required this.isfav,
  });
  final ItemModel item;
  final bool isfav;
  final void Function() pressDelete;
  final void Function() pressContact;
  final void Function() pressItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: pressItem,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    left: 10, top: 5, bottom: 5, right: 5),
                padding: const EdgeInsets.all(5),
                height: 130,
                width: 150,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: ColorManager.litePrimaryColor,
                      offset: Offset(1, 2),
                      blurStyle: BlurStyle.normal,
                      blurRadius: 1,
                    )
                  ],
                ),
                child: CachedNetworkImage(
                  imageUrl:
                      "${Hostting.imageItem}/${item.images == null ? "" : item.images!.first}",
                  placeholder: (context, url) => const ProgressHomeRow(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 90,
                  width: 70,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                children: [
                  Text(
                    item.name,
                    style: FontDef.w500S12Cb,
                  ),
                  Text(
                    item.price.toString(),
                    style: FontDef.w700S12Cb,
                  ),
                  const SizedBox(
                    height: 50,
                  )
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  InkWell(
                    onTap: pressDelete,
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border:
                                Border.all(color: ColorManager.darkGrayIcon)),
                        child: const Icon(
                          Icons.clear,
                          color: ColorManager.primaryColor,
                          size: 20,
                        )),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  IconButton(
                    onPressed: pressContact,
                    icon: Icon(
                      isfav ? Icons.phone_android : Icons.edit,
                      color: ColorManager.primaryColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
