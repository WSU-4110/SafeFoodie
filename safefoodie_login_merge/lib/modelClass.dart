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
    required this.meta,
    required this.results,
  });

  Meta meta;
  List<Result> results;

  factory Foodrecall.fromJson(Map<String, dynamic> json) => Foodrecall(
        meta: Meta.fromJson(json["meta"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Meta {
  Meta({
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
    required this.country,
    required this.city,
    required this.address1,
    required this.reasonForRecall,
    required this.address2,
    required this.productQuantity,
    required this.codeInfo,
    required this.centerClassificationDate,
    required this.distributionPattern,
    required this.state,
    required this.productDescription,
    required this.reportDate,
    required this.classification,
    required this.openfda,
    required this.recallingFirm,
    required this.recallNumber,
    required this.initialFirmNotification,
    required this.productType,
    required this.eventId,
    required this.terminationDate,
    required this.moreCodeInfo,
    required this.recallInitiationDate,
    required this.postalCode,
    required this.voluntaryMandated,
    required this.status,
  });

  String country;
  String city;
  String address1;
  String reasonForRecall;
  String address2;
  String productQuantity;
  String codeInfo;
  String centerClassificationDate;
  String distributionPattern;
  String state;
  String productDescription;
  String reportDate;
  String classification;
  Openfda openfda;
  String recallingFirm;
  String recallNumber;
  String initialFirmNotification;
  String productType;
  String eventId;
  String terminationDate;
  String moreCodeInfo;
  String recallInitiationDate;
  String postalCode;
  String voluntaryMandated;
  String status;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        country: json["country"],
        city: json["city"],
        address1: json["address_1"],
        reasonForRecall: json["reason_for_recall"],
        address2: json["address_2"],
        productQuantity: json["product_quantity"],
        codeInfo: json["code_info"],
        centerClassificationDate: json["center_classification_date"],
        distributionPattern: json["distribution_pattern"],
        state: json["state"],
        productDescription: json["product_description"],
        reportDate: json["report_date"],
        classification: json["classification"],
        openfda: Openfda.fromJson(json["openfda"]),
        recallingFirm: json["recalling_firm"],
        recallNumber: json["recall_number"],
        initialFirmNotification: json["initial_firm_notification"],
        productType: json["product_type"],
        eventId: json["event_id"],
        terminationDate: json["termination_date"] ?? null,
        moreCodeInfo: json["more_code_info"] ?? null,
        recallInitiationDate: json["recall_initiation_date"],
        postalCode: json["postal_code"],
        voluntaryMandated: json["voluntary_mandated"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "country": country,
        "city": city,
        "address_1": address1,
        "reason_for_recall": reasonForRecall,
        "address_2": address2,
        "product_quantity": productQuantity,
        "code_info": codeInfo,
        "center_classification_date": centerClassificationDate,
        "distribution_pattern": distributionPattern,
        "state": state,
        "product_description": productDescription,
        "report_date": reportDate,
        "classification": classification,
        "openfda": openfda.toJson(),
        "recalling_firm": recallingFirm,
        "recall_number": recallNumber,
        "initial_firm_notification": initialFirmNotification,
        "product_type": productType,
        "event_id": eventId,
        "termination_date": terminationDate ?? null,
        "more_code_info": moreCodeInfo ?? null,
        "recall_initiation_date": recallInitiationDate,
        "postal_code": postalCode,
        "voluntary_mandated": voluntaryMandated,
        "status": status,
      };
}

class Openfda {
  Openfda();

  factory Openfda.fromJson(Map<String, dynamic> json) => Openfda();

  Map<String, dynamic> toJson() => {};
}
