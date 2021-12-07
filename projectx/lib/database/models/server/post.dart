class Post {
  String? username;
  String? description;
  String? avatar;
  int? likes;
  bool? isLiked;
  int? comments;

  Post({this.username, this.avatar, this.likes, this.isLiked, this.comments});

  Post.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    avatar = json['avatar'];
    likes = json['likes'];
    isLiked = json['is_liked'];
    comments = json['comments'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['avatar'] = avatar;
    data['likes'] = likes;
    data['is_liked'] = isLiked;
    data['comments'] = comments;
    data['description'] = description;
    return data;
  }
}
