import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  String id;
  String imgUrl;
  String title;
  Blog({
    required this.id,
    required this.imgUrl,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image_url': imgUrl,
      'title': title,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      id: map['id'] as String,
      imgUrl: map['image_url'] as String,
      title: map['title'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) =>
      Blog.fromMap(json.decode(source) as Map<String, dynamic>);
}
