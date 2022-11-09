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
      //these two are the only things needed
    required this.meta,
    required this.results,
  });

  Meta meta;
  List<Result> results;

  factory Foodrecall.fromJson(Map<String, dynamic> json) => Foodrecall(
        meta: Meta.fromJson(json["meta"]),
        results:
            //parses through and puts the strings into a list to sort through!
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Meta {
  Meta({
      //no need to add to this because we don't even call it
    required this.disclaimer,
    required this.terms,
    required this.license,
    required this.lastUpdated,
    required this.results,
  });

  String disclaimer;
  String terms;
  String license;
  DateTime lastUpdated;
  Results results;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        disclaimer: json["disclaimer"],
        terms: json["terms"],
        license: json["license"],
        lastUpdated: DateTime.parse(json["last_updated"]),
        results: Results.fromJson(json["results"]),
      );

  Map<String, dynamic> toJson() => {
        "disclaimer": disclaimer,
        "terms": terms,
        "license": license,
        "last_updated":
            "${lastUpdated.year.toString().padLeft(4, '0')}-${lastUpdated.month.toString().padLeft(2, '0')}-${lastUpdated.day.toString().padLeft(2, '0')}",
        "results": results.toJson(),
      };
}

class Results {
  Results({
      //these are the required parameters!
    required this.skip,
    required this.limit,
    required this.total,
  });

  int skip;
  int limit;
  int total;

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        skip: json["skip"],
        limit: json["limit"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "skip": skip,
        "limit": limit,
        "total": total,
      };
}

class Result {
  Result({
      //deleted the unrequired vars because we are only using the API to call reason_for_recall but
      //this section allows me to add any other info from the FDA's API if we want to in the future!
      //this is the only thing we are calling at this moment for food recall notifications
      //but gives us the flexibility to add other information if we want
    required this.reasonForRecall,
    required this.openfda,
  });
  
  //this section allows me to add any other info from the FDA's API if we want to in the future!
  String reasonForRecall;
  Openfda openfda;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        //this section allows me to add any other info from the FDA's API if we want to in the future!
        //it is dynamic so it allows us to create and manipulate data for our purposes
        //this converts the json to string!
        reasonForRecall: json["reason_for_recall"] as String,
        openfda: Openfda.fromJson(json["openfda"]),
      );

  Map<String, dynamic> toJson() => {
        //this section allows me to add any other info from the FDA's API if we want to in the future!
        //it is dynamic so it allows us to create and manipulate data for our purposes
        "reason_for_recall": reasonForRecall,
        "openfda": openfda.toJson(),
      };
}

class Openfda {
  Openfda();

  factory Openfda.fromJson(Map<String, dynamic> json) => Openfda();

  Map<String, dynamic> toJson() => {};
}
