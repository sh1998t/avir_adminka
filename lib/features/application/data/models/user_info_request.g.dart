// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRequest _$UserInfoRequestFromJson(Map<String, dynamic> json) =>
    UserInfoRequest(
      pinpp: json['pinpp'] as String?,
      documentType: (json['documentType'] as num?)?.toInt(),
      parents: json['parents'] as bool,
      address: json['address'] as bool,
      serialNumber: json['serialNumber'] as String?,
    );

Map<String, dynamic> _$UserInfoRequestToJson(UserInfoRequest instance) =>
    <String, dynamic>{
      'serialNumber': instance.serialNumber,
      'pinpp': instance.pinpp,
      'parents': instance.parents,
      'address': instance.address,
      'documentType': instance.documentType,
    };
