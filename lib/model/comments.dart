class CommentModel {
  late int? id;
  late int? userId;
  late int? itemId;
  late String? comment;
  late String? username;
  late DateTime? date;
  CommentModel(
      {this.comment,
      this.date,
      this.id,
      this.itemId,
      this.userId,
      this.username});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      comment: json["comment"] ?? "",
      date: DateTime.parse(json["created_at"].toString()),
      id: json["id"],
      itemId: json["item_id"],
      userId: json["user_id"],
      username: json["username"] ?? "",
    );
  }
}
