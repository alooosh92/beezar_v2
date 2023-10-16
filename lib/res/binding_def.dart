import '../screen/add_item/add_item_controller.dart';
import '../screen/auth/auth_controller.dart';
import '../screen/item/item_controller.dart';
import '../screen/home/home_controller.dart';
import 'package:get/get.dart';

class BindingDef implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => ItemController(), fenix: true);
    Get.lazyPut(() => AddItemController(), fenix: true);
  }
}
