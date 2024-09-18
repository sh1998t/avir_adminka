import 'package:json_annotation/json_annotation.dart';

part 'invoice_model.g.dart';

@JsonSerializable(explicitToJson: true)
class InvoiceResponse {
  final Data? data;
  final int answereId;
  final String answereMessage;
  final String? answereComment;

  InvoiceResponse({
    required this.data,
    required this.answereId,
    required this.answereMessage,
    this.answereComment,
  });

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => _$InvoiceResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceResponseToJson(this);
}

@JsonSerializable()
class Data {
  final int id;
  final String guid;
  final Invoice? invoiceIDCard;
  final Invoice? invoiceDUK;

  Data({
    required this.id,
    required this.guid,
    this.invoiceIDCard,
    this.invoiceDUK,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Invoice {
  final String serialNumber;
  final int amount;
  final String owner;
  final String budgetAccount;
  final String treasuryAccount;
  final String mfo;
  final String inn;
  final String treasuryName;

  Invoice({
    required this.serialNumber,
    required this.amount,
    required this.owner,
    required this.budgetAccount,
    required this.treasuryAccount,
    required this.mfo,
    required this.inn,
    required this.treasuryName,
  });

  factory Invoice.fromJson(Map<String, dynamic> json) => _$InvoiceFromJson(json);
  Map<String, dynamic> toJson() => _$InvoiceToJson(this);
}
