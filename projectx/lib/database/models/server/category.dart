class Category {
  String? image;

  Category({this.image});

  factory Category.fromJson(Map<String, dynamic> json) => Category(image: json['image']);


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['image'] = image;
    return data;
  }
}