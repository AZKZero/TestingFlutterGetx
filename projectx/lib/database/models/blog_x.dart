/// id : 1
/// title : "X"
/// description : "mess"
/// cover_photo : "url"
/// author_id : 14
/// categories : ["mexx"]

class BlogX {
  BlogX({
    this.id,
    this.title,
    this.description,
    this.coverPhoto,
    this.authorId,
    this.categories,
  });

  BlogX.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    coverPhoto = json['cover_photo'];
    authorId = json['author_id'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
  }

  int? id;
  String? title;
  String? description;
  String? coverPhoto;
  int? authorId;
  List<String>? categories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['cover_photo'] = coverPhoto;
    map['author_id'] = authorId;
    map['categories'] = categories;
    return map;
  }
}
