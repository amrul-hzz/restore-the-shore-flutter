// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.creator,
        required this.creatorName,
        required this.date,
        required this.content,
        required this.image,
    });

    int creator;
    String creatorName;
    DateTime date;
    String content;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        creator: json["creator"],
        creatorName: json["creator_name"],
        date: DateTime.parse(json["date"]),
        content: json["content"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "creator": creator,
        "creator_name": creatorName,
        "date": date.toIso8601String(),
        "content": content,
        "image": image,
    };
}
