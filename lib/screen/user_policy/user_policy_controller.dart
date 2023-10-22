import 'dart:convert';

import 'package:beezer_v2/model/police_model.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserPoliceController extends GetxController {
  List<PoliceModel> listPolice = [];
  Future<void> getPolice() async {
    http.Response response =
        await http.get(Hostting.getPolicy, headers: Hostting().getHeader());
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      for (var element in body["policy"]) {
        listPolice.add(PoliceModel.fromJson(element));
      }
    }
  }
}
