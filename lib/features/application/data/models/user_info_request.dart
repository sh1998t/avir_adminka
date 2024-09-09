import 'package:avir_app/features/application/domain/entities/application_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_request.g.dart';

@JsonSerializable()
class UserInfoRequest extends ApplicationRequestEntity {
  UserInfoRequest(
      {super.pinpp,
      required super.documentType,
      required super.parents,
      required super.address,
      required super.serialNumber});

  Map<String, dynamic> toJson() => _$UserInfoRequestToJson(this);
}
