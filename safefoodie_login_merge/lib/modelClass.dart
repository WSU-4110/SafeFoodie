// To parse this JSON data, do
//
//     final foodrecall = foodrecallFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Foodrecall foodrecallFromJson(String str) =>
    Foodrecall.fromJson(json.decode(str));

String foodrecallToJson(Foodrecall data) => json.encode(data.toJson());

class Foodrecall {
  Foodrecall({
    required this.results,
  });

  List<Result> results;

  factory Foodrecall.fromJson(Map<String, dynamic> json) => Foodrecall(
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    required this.reasonForRecall,
    required this.openfda,
  });

  String reasonForRecall;
  Openfda openfda;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        reasonForRecall: json["reason_for_recall"],
        openfda: Openfda.fromJson(json["openfda"]),
      );

  Map<String, dynamic> toJson() => {
        "reason_for_recall": reasonForRecall,
        "openfda": openfda.toJson(),
      };
}

class Openfda {
  Openfda();

  factory Openfda.fromJson(Map<String, dynamic> json) => Openfda();

  Map<String, dynamic> toJson() => {};
}
