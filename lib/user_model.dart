

class User {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  User({this.userId, this.id, this.title, this.completed});

   User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['completed'] = this.completed;
    return data;
  }
}

class GetUser {
  int? userId;
  int? id;
  String? title;
  String? body;

  GetUser({this.userId, this.id, this.title, this.body});

  factory GetUser.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
      'userId': int userId,
      'id': int id,
      'title': String title,
      'body': String body,
      } => GetUser(
        userId: userId,
        id: id,
        title: title,
        body: body,
      ),
      _ => throw const FormatException("Failed to load Get User"),
    };
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}