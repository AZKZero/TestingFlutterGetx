class User {
  String? avatar;
  String? username;

  User({this.avatar, this.username});

  factory User.fromJson(Map<String, dynamic> json) => User(
        avatar: json['avatar'],
        username: json['username'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['avatar'] = avatar;
    data['username'] = username;
    return data;
  }
}
