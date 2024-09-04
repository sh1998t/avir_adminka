abstract class ApplicationRequestEntity {
  final String? serialNumber;
  final String? dateBirth;
  final String? pinpp;
  final bool parents;
  final bool address;

  ApplicationRequestEntity(
    {
    this.serialNumber,
    this.dateBirth,
    this.pinpp,
    required this.parents,
        required this.address,

  });
}
