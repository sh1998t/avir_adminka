abstract class UserInfoRequestEntity {
  final String? serialNumber;
  final String? dateBirth;
  final String? pinpp;
  final bool parents;
  final bool address;
  final int? doctype;

  UserInfoRequestEntity({
    this.serialNumber,
    this.dateBirth,
    this.pinpp,
    required this.parents,
    required this.address,
    this.doctype,
  });
  Map<String, dynamic> toJson();
}
