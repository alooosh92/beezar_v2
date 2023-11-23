import 'package:beezer_v2/res/font_def.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/widget/app_bar_auth.dart';
import 'package:beezer_v2/widget/progress_home_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MassegeScreen extends StatelessWidget {
  const MassegeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return Scaffold(
      appBar: appBarAuth(() {
        Get.back();
      }, "الإشعارات", context),
      body: FutureBuilder(
        future: homeController.getMassege(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const ProgressHomeRow();
          }
          if (homeController.listMassege.isEmpty) {
            return const Center(
              child: Text("لا يوجد اشعارات لعرضها"),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: homeController.listMassege.length,
              itemBuilder: (context, index) {
                var item = homeController.itemModelAll
                    .where(
                      (p0) => p0.id == homeController.listMassege[index].itemId,
                    )
                    .firstOrNull;
                return InkWell(
                  onTap: () {
                    if (item != null) {
                      homeController.toItem(item);
                      
                    }
                  },
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                              "${item != null ? item.id : ''} - ${item != null ? item.name : ''}"),
                        ],
                      ),
                      SizedBox(
                          width: MediaQuery.sizeOf(context).width - 20,
                          child: Text(
                            homeController.listMassege[index].comment,
                            overflow: TextOverflow.fade,
                            style: FontDef.w400S15Cb,
                          )),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homeController.listMassege[index].username,
                              style: FontDef.w500S13Cg,
                            ),
                            Text(
                              (homeController.listMassege[index].date),
                              style: FontDef.w500S13Cg,
                            ),
                          ]),
                      const Divider(),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
