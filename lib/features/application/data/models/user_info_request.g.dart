// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRequest _$UserInfoRequestFromJson(Map<String, dynamic> json) =>
    UserInfoRequest(
      doctype: (json['doctype'] as num?)?.toInt(),
      parents: json['parents'] as bool,
      address: json['address'] as bool,
      serialNumber: json['serialNumber'] as String?,
      dateBirth: json['dateBirth'] as String?,
    );

Map<String, dynamic> _$UserInfoRequestToJson(UserInfoRequest instance) =>
    <String, dynamic>{
      'serialNumber': instance.serialNumber,
      'dateBirth': instance.dateBirth,
      'parents': instance.parents,
      'address': instance.address,
      'doctype': instance.doctype,
    };

UserInfoWithUUIDRequest _$UserInfoWithUUIDRequestFromJson(
        Map<String, dynamic> json) =>
    UserInfoWithUUIDRequest(
      parents: json['parents'] as bool,
      address: json['address'] as bool,
      pinpp: json['pinpp'] as String?,
    );

Map<String, dynamic> _$UserInfoWithUUIDRequestToJson(
        UserInfoWithUUIDRequest instance) =>
    <String, dynamic>{
      'pinpp': instance.pinpp,
      'parents': instance.parents,
      'address': instance.address,
    };
