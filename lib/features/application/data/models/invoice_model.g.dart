// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      answereId: (json['answereId'] as num).toInt(),
      answereMessage: json['answereMessage'] as String,
      answereComment: json['answereComment'] as String?,
    );

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      'data': instance.data?.toJson(),
      'answereId': instance.answereId,
      'answereMessage': instance.answereMessage,
      'answereComment': instance.answereComment,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num).toInt(),
      guid: json['guid'] as String,
      invoiceIDCard: json['invoiceIDCard'] == null
          ? null
          : Invoice.fromJson(json['invoiceIDCard'] as Map<String, dynamic>),
      invoiceDUK: json['invoiceDUK'] == null
          ? null
          : Invoice.fromJson(json['invoiceDUK'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'guid': instance.guid,
      'invoiceIDCard': instance.invoiceIDCard,
      'invoiceDUK': instance.invoiceDUK,
    };

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      serialNumber: json['serialNumber'] as String,
      amount: (json['amount'] as num).toInt(),
      owner: json['owner'] as String,
      budgetAccount: json['budgetAccount'] as String,
      treasuryAccount: json['treasuryAccount'] as String,
      mfo: json['mfo'] as String,
      inn: json['inn'] as String,
      treasuryName: json['treasuryName'] as String,
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
      'serialNumber': instance.serialNumber,
      'amount': instance.amount,
      'owner': instance.owner,
      'budgetAccount': instance.budgetAccount,
      'treasuryAccount': instance.treasuryAccount,
      'mfo': instance.mfo,
      'inn': instance.inn,
      'treasuryName': instance.treasuryName,
    };
