// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      document: json['document'] == null
          ? null
          : Document.fromJson(json['document'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'person': instance.person,
      'document': instance.document,
    };

Person _$PersonFromJson(Map<String, dynamic> json) => Person(
      guid: json['guid'] as String,
      pinpp: json['pinpp'] as String,
      surnameCirillic: json['surnameCirillic'] as String,
      nameCirillic: json['nameCirillic'] as String,
      patronymCirillic: json['patronymCirillic'] as String,
      surnameLatin: json['surnameLatin'] as String,
      nameLatin: json['nameLatin'] as String,
      patronymLatin: json['patronymLatin'] as String,
      surnameEnglish: json['surnameEnglish'] as String,
      nameEnglish: json['nameEnglish'] as String,
      patronymEnglish: json['patronymEnglish'] as String,
      dateBirth: json['dateBirth'] as String,
      sex: Code.fromJson(json['sex'] as Map<String, dynamic>),
      nationality: Code.fromJson(json['nationality'] as Map<String, dynamic>),
      citizenship: Code.fromJson(json['citizenship'] as Map<String, dynamic>),
      birthCountry: Code.fromJson(json['birthCountry'] as Map<String, dynamic>),
      birthRegion: Code.fromJson(json['birthRegion'] as Map<String, dynamic>),
      birthDistrict:
          Code.fromJson(json['birthDistrict'] as Map<String, dynamic>),
      birthPlaceLatin: json['birthPlaceLatin'] as String,
      birthPlaceEnglish: json['birthPlaceEnglish'] as String?,
    );

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'guid': instance.guid,
      'pinpp': instance.pinpp,
      'surnameCirillic': instance.surnameCirillic,
      'nameCirillic': instance.nameCirillic,
      'patronymCirillic': instance.patronymCirillic,
      'surnameLatin': instance.surnameLatin,
      'nameLatin': instance.nameLatin,
      'patronymLatin': instance.patronymLatin,
      'surnameEnglish': instance.surnameEnglish,
      'nameEnglish': instance.nameEnglish,
      'patronymEnglish': instance.patronymEnglish,
      'dateBirth': instance.dateBirth,
      'sex': instance.sex,
      'nationality': instance.nationality,
      'citizenship': instance.citizenship,
      'birthCountry': instance.birthCountry,
      'birthRegion': instance.birthRegion,
      'birthDistrict': instance.birthDistrict,
      'birthPlaceLatin': instance.birthPlaceLatin,
      'birthPlaceEnglish': instance.birthPlaceEnglish,
    };

Code _$CodeFromJson(Map<String, dynamic> json) => Code(
      id: (json['id'] as num?)?.toInt(),
      value: json['value'] as String?,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$CodeToJson(Code instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      documentType: Code.fromJson(json['documentType'] as Map<String, dynamic>),
      serialNumber: json['serialNumber'] as String,
      issuedBy: json['issuedBy'] as String,
      dateIssue: json['dateIssue'] as String,
      dateValid: json['dateValid'] as String,
      documentStatus:
          Code.fromJson(json['documentStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'documentType': instance.documentType,
      'serialNumber': instance.serialNumber,
      'issuedBy': instance.issuedBy,
      'dateIssue': instance.dateIssue,
      'dateValid': instance.dateValid,
      'documentStatus': instance.documentStatus,
    };
