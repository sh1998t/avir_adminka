import 'package:avir_app/features/application/domain/entities/application_request.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info_request.g.dart';

@JsonSerializable()
class UserInfoRequest extends ApplicationRequestEntity {
  UserInfoRequest(
      {required super.doctype,
      required super.parents,
      required super.address,
      required super.serialNumber,
      super.dateBirth});
  @override
  Map<String, dynamic> toJson() => _$UserInfoRequestToJson(this);
}

@JsonSerializable()
class UserInfoWithUUIDRequest extends ApplicationRequestEntity {
  UserInfoWithUUIDRequest({
    required super.parents,
    required super.address,
    super.pinpp,
  });
@override
Map<String, dynamic> toJson() => _$UserInfoWithUUIDRequestToJson(this);
}
