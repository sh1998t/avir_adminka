import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_request.g.dart';
@JsonSerializable()
class ApplicationRequest {
  String? serviceId;
  String? comment;
  int idCardType;
  Person person;
  Person newPerson;
  Document document;
  int reasonIdCard;
  String? mobilePhone;
  String? phone;
  int duration;

  ApplicationRequest({
    required this.duration,
    this.comment,
    required this.idCardType,
    required this.person,
    required this.newPerson,
    required this.document,
    required this.reasonIdCard,
     this.mobilePhone,
    this.phone,
    this.serviceId,

  });

  Map<String, dynamic> toJson() => _$ApplicationRequestToJson(this);
}
