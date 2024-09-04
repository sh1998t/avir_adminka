import 'package:json_annotation/json_annotation.dart';

import 'package:avir_app/features/auth/domain/error_entity.dart';
part 'error_model.g.dart';
@JsonSerializable()
class ErrorModel extends ErrorEntity{
  ErrorModel({required super.statusCode, required super.message});

  factory ErrorModel.fromJson(Map<String, dynamic> json) => _$ErrorModelFromJson(json);
}