// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonModel _$PersonModelFromJson(Map<String, dynamic> json) => PersonModel(
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PersonModelToJson(PersonModel instance) =>
    <String, dynamic>{
      'person': instance.person,
      'document': instance.document,
      'address': instance.address,
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
      patronymEnglish: json['patronymEnglish'] as String?,
      dateBirth: json['dateBirth'] as String,
      sex: Sex.fromJson(json['sex'] as Map<String, dynamic>),
      nationality:
          Nationality.fromJson(json['nationality'] as Map<String, dynamic>),
      citizenship:
          Citizenship.fromJson(json['citizenship'] as Map<String, dynamic>),
      birthCountry:
          BirthCountry.fromJson(json['birthCountry'] as Map<String, dynamic>),
      birthRegion:
          BirthRegion.fromJson(json['birthRegion'] as Map<String, dynamic>),
      birthDistrict:
          BirthDistrict.fromJson(json['birthDistrict'] as Map<String, dynamic>),
      birthPlaceLatin: json['birthPlaceLatin'] as String,
      birthPlaceEnglish: json['birthPlaceEnglish'] as String,
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

Sex _$SexFromJson(Map<String, dynamic> json) => Sex(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$SexToJson(Sex instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Nationality _$NationalityFromJson(Map<String, dynamic> json) => Nationality(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$NationalityToJson(Nationality instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Citizenship _$CitizenshipFromJson(Map<String, dynamic> json) => Citizenship(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$CitizenshipToJson(Citizenship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

BirthCountry _$BirthCountryFromJson(Map<String, dynamic> json) => BirthCountry(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$BirthCountryToJson(BirthCountry instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

BirthRegion _$BirthRegionFromJson(Map<String, dynamic> json) => BirthRegion(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$BirthRegionToJson(BirthRegion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

BirthDistrict _$BirthDistrictFromJson(Map<String, dynamic> json) =>
    BirthDistrict(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$BirthDistrictToJson(BirthDistrict instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Document _$DocumentFromJson(Map<String, dynamic> json) => Document(
      documentType: DocumentTypeModel.fromJson(
          json['documentType'] as Map<String, dynamic>),
      serialNumber: json['serialNumber'] as String,
      issuedBy: json['issuedBy'] as String,
      dateIssue: json['dateIssue'] as String,
      dateValid: json['dateValid'] as String,
      documentStatus: DocumentStatus.fromJson(
          json['documentStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DocumentToJson(Document instance) => <String, dynamic>{
      'documentType': instance.documentType,
      'serialNumber': instance.serialNumber,
      'issuedBy': instance.issuedBy,
      'dateIssue': instance.dateIssue,
      'dateValid': instance.dateValid,
      'documentStatus': instance.documentStatus,
    };

DocumentTypeModel _$DocumentTypeModelFromJson(Map<String, dynamic> json) =>
    DocumentTypeModel(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$DocumentTypeModelToJson(DocumentTypeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

DocumentStatus _$DocumentStatusFromJson(Map<String, dynamic> json) =>
    DocumentStatus(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$DocumentStatusToJson(DocumentStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      cadastreNumber: json['cadastreNumber'] as String,
      country: Country.fromJson(json['country'] as Map<String, dynamic>),
      region: Region.fromJson(json['region'] as Map<String, dynamic>),
      district: District.fromJson(json['district'] as Map<String, dynamic>),
      address: json['address'] as String,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'cadastreNumber': instance.cadastreNumber,
      'country': instance.country,
      'region': instance.region,
      'district': instance.district,
      'address': instance.address,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String?,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

Region _$RegionFromJson(Map<String, dynamic> json) => Region(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String?,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      id: (json['id'] as num).toInt(),
      value: json['value'] as String?,
      idValue: json['idValue'] as String,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'value': instance.value,
      'idValue': instance.idValue,
    };
