// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplicationRequest _$ApplicationRequestFromJson(Map<String, dynamic> json) =>
    ApplicationRequest(
      duration: (json['duration'] as num).toInt(),
      comment: json['comment'] as String?,
      idCardType: (json['idCardType'] as num).toInt(),
      person: Person.fromJson(json['person'] as Map<String, dynamic>),
      newPerson: Person.fromJson(json['newPerson'] as Map<String, dynamic>),
      document: Document.fromJson(json['document'] as Map<String, dynamic>),
      reasonIdCard: (json['reasonIdCard'] as num).toInt(),
      mobilePhone: json['mobilePhone'] as String?,
      phone: json['phone'] as String?,
      serviceId: json['serviceId'] as String?,
    );

Map<String, dynamic> _$ApplicationRequestToJson(ApplicationRequest instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'comment': instance.comment,
      'idCardType': instance.idCardType,
      'person': instance.person,
      'newPerson': instance.newPerson,
      'document': instance.document,
      'reasonIdCard': instance.reasonIdCard,
      'mobilePhone': instance.mobilePhone,
      'phone': instance.phone,
      'duration': instance.duration,
    };
