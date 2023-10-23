import 'package:beezer_v2/widget/change_date_to_day.dart';

class Massege {
  late int id;
  late int userId;
  late int itemId;
  late String comment;
  late String username;
  late String date;

  Massege({
    required this.comment,
    required this.date,
    required this.id,
    required this.itemId,
    required this.userId,
    required this.username,
  });

  factory Massege.fromJson(Map<String, dynamic> json) {
    return Massege(
      comment: json["comment"],
      date: changeDateToDay(DateTime.parse(json["created_at"].toString())),
      id: json["id"],
      itemId: json["item_id"],
      userId: json["user_id"],
      username: json["username"],
    );
  }
}
