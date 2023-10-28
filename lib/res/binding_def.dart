import 'package:beezer_v2/screen/add_item/add_item_controller.dart';
import 'package:beezer_v2/screen/auth/auth_controller.dart';
import 'package:beezer_v2/screen/contact_us/contact_us_controller.dart';
import 'package:beezer_v2/screen/item/item_controller.dart';
import 'package:beezer_v2/screen/home/home_controller.dart';
import 'package:beezer_v2/screen/user_policy/user_policy_controller.dart';
import 'package:get/get.dart';

class BindingDef implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ItemController(), fenix: true);
    Get.lazyPut(() => AddItemController(), fenix: true);
    Get.lazyPut(() => UserPoliceController(), fenix: true);
    Get.lazyPut(() => ContactUsController(), fenix: true);
  }
}
