import 'dart:convert';
import 'package:beezer_v2/model/comments.dart';
import 'package:beezer_v2/res/hostting.dart';
import 'package:beezer_v2/widget/progress_def.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ItemController extends GetxController {
  PageController pageController = PageController();
  RxInt pagenum = 0.obs;
  RxList<CommentModel> listComment = RxList<CommentModel>();

  void changeimage(int val) {
    pagenum.value = val;
  }

  Future<List<CommentModel>> getComment(int id) async {
    http.Response response = await http.get(Hostting.getComment(id),
        headers: Hostting().getHeader());
    List<CommentModel> list = [];
    if (response.statusCode == 200) {
      listComment.clear();
      var body = jsonDecode(response.body);
      for (var element in body["data"]) {
        listComment.add(CommentModel.fromJson(element));
        list.add(CommentModel.fromJson(element));
      }
    }
    refresh();
    return list;
  }

  Future<bool> writeComment(int id, String comment) async {
    progressDef();
    http.Response response = await http.post(Hostting.writeComment,
        headers: Hostting().getHeader(),
        body: {"item_id": id.toString(), "comment": comment});
    if (response.statusCode == 200) {
      await getComment(id);
      Get.back();
      return true;
    }
    Get.back();
    return false;
  }

  Future<bool> deleteComment(int id, int itemId) async {
    progressDef();
    http.Response response = await http.delete(
      Hostting.deleteComment(id),
      headers: Hostting().getHeader(),
    );
    if (response.statusCode == 200) {
      await getComment(itemId);
      Get.back();
      return true;
    }
    Get.back();
    return false;
  }
}
