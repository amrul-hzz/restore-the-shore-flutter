// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

Quote quoteFromJson(String str) => Quote.fromJson(json.decode(str));

String quoteToJson(Quote data) => json.encode(data.toJson());

class Quote {
    Quote({
        required this.randomQuote,
        required this.name,
    });

    String randomQuote;
    String name;

    factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        randomQuote: json["random_quote"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "random_quote": randomQuote,
        "name": name,
    };
}