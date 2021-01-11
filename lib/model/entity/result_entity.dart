// To parse this JSON data, do
//
//     final resultEntity = resultEntityFromJson(jsonString);

import 'dart:convert';

ResultEntity resultEntityFromJson(String str) => ResultEntity.fromJson(json.decode(str));

String resultEntityToJson(ResultEntity data) => json.encode(data.toJson());

class ResultEntity {
  ResultEntity({
    this.results,
  });

  List<Result> results;

  factory ResultEntity.fromJson(Map<String, dynamic> json) => ResultEntity(
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.createdAt,
    this.imageName,
    this.imageUrl,
    this.objectId,
    this.updatedAt,
  });

  DateTime createdAt;
  String imageName;
  String imageUrl;
  String objectId;
  DateTime updatedAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    createdAt: DateTime.parse(json["createdAt"]),
    imageName: json["imageName"],
    imageUrl: json["imageUrl"],
    objectId: json["objectId"],
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "imageName": imageName,
    "imageUrl": imageUrl,
    "objectId": objectId,
    "updatedAt": updatedAt.toIso8601String(),
  };
}
