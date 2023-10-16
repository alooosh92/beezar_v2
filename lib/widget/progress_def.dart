import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> progressDef() {
  return Get.dialog(const Center(
    child: CircularProgressIndicator(),
  ));
}
