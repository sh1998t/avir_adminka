// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoRequest _$UserInfoRequestFromJson(Map<String, dynamic> json) =>
    UserInfoRequest(
      pinpp: json['pinpp'] as String?,
      parents: json['parents'] as bool,
      address: json['address'] as bool,
    );

Map<String, dynamic> _$UserInfoRequestToJson(UserInfoRequest instance) =>
    <String, dynamic>{
      'pinpp': instance.pinpp,
      'parents': instance.parents,
      'address': instance.address,
    };
