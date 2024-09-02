// To parse this JSON data, do
//
//     final quote = quoteFromJson(jsonString);

import 'dart:convert';

List<Quote> quoteFromJson(String str) =>
    List<Quote>.from(json.decode(str).map((x) => Quote.fromJson(x)));

String quoteToJson(List<Quote> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quote {
  String q;
  String a;
  String h;

  Quote({
    required this.q,
    required this.a,
    required this.h,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        q: json["q"],
        a: json["a"],
        h: json["h"],
      );

  Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "h": h,
      };
}
