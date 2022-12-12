// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';
import 'package:pbp_django_auth/pbp_django_auth.dart';

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
        required this.creator_name,
        required this.date,
        required this.content,
        required this.image,
    });

    int creator;
    String creator_name;
    DateTime date;
    String content;
    String image;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        creator: json["creator"],
        creator_name: json["creator_name"],
        date: DateTime.parse(json["date"]),
        content: json["content"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "creator": creator,
        "creator_name": creator_name,
        "date": date.toIso8601String(),
        "content": content,
        "image": image,
    };
}

Future<List<Post>> fetchPosts(request) async {
  var url = 'https://restore-the-shore.up.railway.app/forum/json/';
  var response = await request.get(url);
  var data = response;

  List<Post> listPosts = [];
  for (var d in data) {
    if (d != null) {
      listPosts.add(Post.fromJson(d));
    }
  }
  return listPosts;
}

Future<Post?> postPost(CookieRequest request, String content, String image) async {
    String url = 'https://restore-the-shore.up.railway.app/forum/post-post-api/';
    dynamic response = await request.post(url, {
      'content': content,
      'image': image,
    });

    return Post.fromJson(response);

}


