import 'package:get_storage/get_storage.dart';

class Hostting {
  var storeg = GetStorage();
  static const String host = "https://beezar.arg-tr.com";
  static const String api = "$host/api";

  //hrader
  Map<String, String> getHeader() {
    var token = storeg.read("token");
    if (token != null && token.toString().isNotEmpty) {
      return {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
    return {
      'Accept': 'application/json',
    };
  }

  //images
  static const String imageCategory = "$host/public";
  static const String imageItem = "$host/items";

  //api
  static Uri login = Uri.parse("$api/login");
  static Uri register = Uri.parse("$api/signup");
  static Uri logout = Uri.parse("$api/logout");
  static Uri checkTokenValidity = Uri.parse("$api/check-token-validity");
  static Uri getCategory = Uri.parse("$api/get_category");
  static Uri getSubCategory(int num) => Uri.parse("$api/get_sub_category/$num");
  static Uri getItems = Uri.parse("$api/get_all_items");
  static Uri getFavourite = Uri.parse("$api/get_item_in my favourite");
  static Uri addDeleteFavourite(int id) =>
      Uri.parse("$api/add&delete_for_favourite/$id");
  static Uri getMyItem = Uri.parse("$api/getMyItems");
  static Uri updateUser = Uri.parse("$api/user");
  static Uri getUser = Uri.parse("$api/profile");
  static Uri createItem = Uri.parse("$api/create_item");
}
