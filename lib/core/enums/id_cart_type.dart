enum IdCartEnum {
  idCard(
    {
      'name': "id_cart",
      'id': 501,
      'duration': 120,
    },
  ),
  noCitizenshipIdCard(
    {
      'name': "no_citizenship_id_cart",
      'id': 502,
      'duration': 120,
    },
  ),
  foreignerIdCard(
    {
      'name': "foreigner_id_cart",
      'id': 503,
      'duration': 120,
    },
  ),
  childIdCard(
    {
      'name': "child_id_cart",
      'id': 504,
      'duration': 120,
    },
  ),
  ;

  final Map<String, dynamic> key;

  const IdCartEnum(this.key);
}
