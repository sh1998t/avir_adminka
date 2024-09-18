import 'package:avir_app/features/application/data/models/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'application_request.g.dart';
@JsonSerializable()
class ApplicationRequest {
  final String user;
  final int division;
  final int id;
  final String guid;
  String? comment;
  int idCardType;
  Person person;
  Person newPerson;
  Document document;
  int reasonIdCard;
  String? mobilePhone;
  String? phone;
  String registrationDate;

  ApplicationRequest({
    required  this.user,
    required this.division,
    required  this.id,
    required this.guid,
    this.comment,
    required this.idCardType,
    required this.person,
    required this.newPerson,
    required this.document,
    required this.reasonIdCard,
     this.mobilePhone,
    this.phone,
    required this.registrationDate,

  });
}
