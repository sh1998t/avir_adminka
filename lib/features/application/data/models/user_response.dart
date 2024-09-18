import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class PersonModel {
  final Person person;
  final Document document;
  final Address? address;

  // final dynamic father;
  // final dynamic mother;

  PersonModel({
    required this.person,
    required this.document,
    required this.address,
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
  final String? patronymEnglish;
  final String dateBirth;
  final Sex sex;
  final Nationality nationality;
  final Citizenship citizenship;
  final BirthCountry birthCountry;
  final BirthRegion birthRegion;
  final BirthDistrict birthDistrict;
  final String birthPlaceLatin;
  final String birthPlaceEnglish;

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
    this.patronymEnglish,
    required this.dateBirth,
    required this.sex,
    required this.nationality,
    required this.citizenship,
    required this.birthCountry,
    required this.birthRegion,
    required this.birthDistrict,
    required this.birthPlaceLatin,
    required this.birthPlaceEnglish,
  });

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);

  Map<String, dynamic> toJson({
    required int personStatus,
  }) =>
      {
        'guid': guid,
        'pinpp': pinpp,
        'surnameCirillic': surnameCirillic,
        'nameCirillic': nameCirillic,
        'patronymCirillic': patronymCirillic,
        'surnameLatin': surnameLatin,
        'nameLatin': nameLatin,
        'patronymLatin': patronymLatin,
        'surnameEnglish': surnameEnglish,
        'nameEnglish': nameEnglish,
        'patronymEnglish': patronymEnglish,
        'dateBirth': dateBirth,
        'sex': sex.id,
        'nationality': nationality.id,
        'citizenship': citizenship.id,
        "birthPlace": {
          "country": birthCountry.id,
          'region': birthRegion.id,
          'district': birthDistrict.id,
          "birthPlaceLatin": birthPlaceLatin,
          'birthPlaceEnglish': birthPlaceEnglish,
        },
        'personStatus': personStatus,
      };
}

@JsonSerializable()
class Sex {
  final int id;
  final String value;
  final String idValue;

  Sex({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory Sex.fromJson(Map<String, dynamic> json) => _$SexFromJson(json);

  Map<String, dynamic> toJson() => _$SexToJson(this);
}

@JsonSerializable()
class Nationality {
  final int id;
  final String value;
  final String idValue;

  Nationality({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) =>
      _$NationalityFromJson(json);

  Map<String, dynamic> toJson() => _$NationalityToJson(this);
}

@JsonSerializable()
class Citizenship {
  final int id;
  final String value;
  final String idValue;

  Citizenship({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory Citizenship.fromJson(Map<String, dynamic> json) =>
      _$CitizenshipFromJson(json);

  Map<String, dynamic> toJson() => _$CitizenshipToJson(this);
}

@JsonSerializable()
class BirthCountry {
  final int id;
  final String value;
  final String idValue;

  BirthCountry({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory BirthCountry.fromJson(Map<String, dynamic> json) =>
      _$BirthCountryFromJson(json);

  Map<String, dynamic> toJson() => _$BirthCountryToJson(this);
}

@JsonSerializable()
class BirthRegion {
  final int id;
  final String value;
  final String idValue;

  BirthRegion({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory BirthRegion.fromJson(Map<String, dynamic> json) =>
      _$BirthRegionFromJson(json);

  Map<String, dynamic> toJson() => _$BirthRegionToJson(this);
}

@JsonSerializable()
class BirthDistrict {
  final int id;
  final String value;
  final String idValue;

  BirthDistrict({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory BirthDistrict.fromJson(Map<String, dynamic> json) =>
      _$BirthDistrictFromJson(json);

  Map<String, dynamic> toJson() => _$BirthDistrictToJson(this);
}

@JsonSerializable()
class Document {
  final DocumentTypeModel documentType;
  final String serialNumber;
  final String issuedBy;
  final String dateIssue;
  final String dateValid;
  final DocumentStatus documentStatus;

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

  Map<String, dynamic> toJson() =>{
    "documentType": documentType.id,
    "serialNumber": serialNumber,
    "issuedBy": issuedBy,
    "dateIssue": dateIssue,
    "dateValid": dateValid,
    "comment": '',
    "documentStatus": documentStatus.id
  };
}

@JsonSerializable()
class DocumentTypeModel {
  final int id;
  final String value;
  final String idValue;

  DocumentTypeModel({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentTypeModelFromJson(json);
}

@JsonSerializable()
class DocumentStatus {
  final int id;
  final String value;
  final String idValue;

  DocumentStatus({
    required this.id,
    required this.value,
    required this.idValue,
  });

  factory DocumentStatus.fromJson(Map<String, dynamic> json) =>
      _$DocumentStatusFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentStatusToJson(this);
}

@JsonSerializable()
class Address {
  final String cadastreNumber;
  final Country country;
  final Region region;
  final District district;
  final String address;

  Address({
    required this.cadastreNumber,
    required this.country,
    required this.region,
    required this.district,
    required this.address,
  });

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Country {
  final int id;
  final String? value;
  final String idValue;

  Country({
    required this.id,
    this.value,
    required this.idValue,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Region {
  final int id;
  final String? value;
  final String idValue;

  Region({
    required this.id,
    this.value,
    required this.idValue,
  });

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);

  Map<String, dynamic> toJson() => _$RegionToJson(this);
}

@JsonSerializable()
class District {
  final int id;
  final String? value;
  final String idValue;

  District({
    required this.id,
    this.value,
    required this.idValue,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);
}
