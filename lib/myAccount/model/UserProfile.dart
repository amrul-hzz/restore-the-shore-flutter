// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert';

List<UserProfile> userProfileFromJson(String str) => List<UserProfile>.from(json.decode(str).map((x) => UserProfile.fromJson(x)));

String userProfileToJson(List<UserProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfile {
  UserProfile({
    required this.model,
    required this.pk,
    required this.fields,
  });

  Model? model;
  int pk;
  Fields fields;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    model: modelValues.map[json["model"]],
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
    required this.user,
    required this.userPoint,
    required this.username,
    required this.eventsJoined,
  });

  int user;
  int userPoint;
  String username;
  List<int> eventsJoined;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    user: json["user"],
    userPoint: json["user_point"],
    username: json["username"],
    eventsJoined: List<int>.from(json["events_joined"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "user": user,
    "user_point": userPoint,
    "username": username,
    "events_joined": List<dynamic>.from(eventsJoined.map((x) => x)),
  };

}

final modelValues = EnumValues({
    "landing_page.useraccount": Model.LANDING_PAGE_USERACCOUNT
});

enum Model { LANDING_PAGE_USERACCOUNT }

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

Future<List<UserProfile>> fetchUserProfile(request) async {
  var url = 'https://restore-the-shore.up.railway.app/myaccount/json/';
  var response = await request.get(url);
  var data = response;
  List<UserProfile> profileList = [];
  for (var d in data) {
    if (d != null) {
      profileList.add(UserProfile.fromJson(d));
    }
  }
  return profileList;
}