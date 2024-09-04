import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class PersonModel {
  final Person person;
  final Document? document;
  // final Address? address;
  // final Parent? father;
  // final Parent? mother;

  PersonModel({
    required this.person,
    this.document,
    // this.address,
    // this.father,
    // this.mother,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PersonModelToJson(this);
}

@JsonSerializable()
class Person {
  final String guid;
  final String pinpp;
  final String surnameCirillic;
  final String nameCirillic;
  final String patronymCirillic;
  final String surnameLatin;
  final String nameLatin;
  final String patronymLatin;
  final String surnameEnglish;
  final String nameEnglish;
  final String patronymEnglish;
  final String dateBirth;
  final Code sex;
  final Code nationality;
  final Code citizenship;
  final Code birthCountry;
  final Code birthRegion;
  final Code birthDistrict;
  final String birthPlaceLatin;
  final String? birthPlaceEnglish;

  Person({
    required this.guid,
    required this.pinpp,
    required this.surnameCirillic,
    required this.nameCirillic,
    required this.patronymCirillic,
    required this.surnameLatin,
    required this.nameLatin,
    required this.patronymLatin,
    required this.surnameEnglish,
    required this.nameEnglish,
    required this.patronymEnglish,
    required this.dateBirth,
    required this.sex,
    required this.nationality,
    required this.citizenship,
    required this.birthCountry,
    required this.birthRegion,
    required this.birthDistrict,
    required this.birthPlaceLatin,
    this.birthPlaceEnglish,
  });

  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);

  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

@JsonSerializable()
class Code {
  final int? id;
  final String? value;
  final String idValue;

  Code({
     this.id,
    this.value,
    required this.idValue,
  });

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);

  Map<String, dynamic> toJson() => _$CodeToJson(this);
}

@JsonSerializable()
class Document {
  final Code documentType;
  final String serialNumber;
  final String issuedBy;
  final String dateIssue;
  final String dateValid;
  final Code documentStatus;

  Document({
    required this.documentType,
    required this.serialNumber,
    required this.issuedBy,
    required this.dateIssue,
    required this.dateValid,
    required this.documentStatus,
  });

  factory Document.fromJson(Map<String, dynamic> json) =>
      _$DocumentFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

// @JsonSerializable()
// class Address {
//   // Define fields similar to the ones used in other classes
//   // Include a factory and toJson method
// }
//
// @JsonSerializable()
// class Parent {
//   // Define fields similar to the ones used in other classes
//   // Include a factory and toJson method
// }
