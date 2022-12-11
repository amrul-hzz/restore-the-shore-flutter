// To parse this JSON data, do
//
//     final leaderBoard = leaderBoardFromJson(jsonString);

import 'dart:convert';

List<LeaderBoard> leaderBoardFromJson(String str) => List<LeaderBoard>.from(json.decode(str).map((x) => LeaderBoard.fromJson(x)));

String leaderBoardToJson(List<LeaderBoard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaderBoard {
    LeaderBoard({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory LeaderBoard.fromJson(Map<String, dynamic> json) => LeaderBoard(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse![model],
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

enum Model { LANDING_PAGE_USERACCOUNT }

final modelValues = EnumValues({
    "landing_page.useraccount": Model.LANDING_PAGE_USERACCOUNT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}