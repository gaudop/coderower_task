class ActivityDataModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  ActivityDataModel({this.userId, this.id, this.title, this.body});

  ActivityDataModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
