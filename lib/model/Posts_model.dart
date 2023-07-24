class Posts {
  dynamic id, title, image, content, sale;

  Posts({this.id, this.title, this.image, this.content, this.sale});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      content: json["content"],
      sale: json["sale"],
    );
  }
}