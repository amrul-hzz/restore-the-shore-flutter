// To parse this JSON data, do
//
//     final comment = commentFromJson(jsonString);

import 'dart:convert';

List<Comment> commentFromJson(String str) => List<Comment>.from(json.decode(str).map((x) => Comment.fromJson(x)));

String commentToJson(List<Comment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Comment {
    Comment({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
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
        required this.creator_name,
        required this.date,
        required this.content,
        required this.originalPostId,
    });

    int creator;
    String creator_name;
    DateTime date;
    String content;
    int originalPostId;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        creator: json["creator"],
        creator_name: json["creator_name"],
        date: DateTime.parse(json["date"]),
        content: json["content"],
        originalPostId: json["original_post_id"],
    );

    Map<String, dynamic> toJson() => {
        "creator": creator,
        "creator_name": creator_name,
        "date": date.toIso8601String(),
        "content": content,
        "original_post_id": originalPostId,
    };
}
