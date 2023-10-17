import 'dart:convert';
import 'package:mongo_dart/mongo_dart.dart';

FamilyDataModel familyDataModelFromJson(String str) => FamilyDataModel.fromJson(json.decode(str));

String familyDataModelToJson(FamilyDataModel data) => json.encode(data.toJson());

class FamilyDataModel {
  ObjectId id;
  List<String> members;

  FamilyDataModel({
    required this.id,
    required this.members,
  });

  factory FamilyDataModel.fromJson(Map<String, dynamic> json) => FamilyDataModel(
    id: json["_id"],
    members: List<String>.from(json["members"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "members": List<dynamic>.from(members.map((x) => x)),
  };
}
