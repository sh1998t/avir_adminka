enum IdCartEnum {
  idCard(
    {'name': "id_cart", 'id': 501},
  ),
  noCitizenshipIdCard(
    {'name': "no_citizenship_id_cart", 'id': 502},
  ), foreignerIdCard(
    {'name': "foreigner_id_cart", 'id': 503},
  ), childIdCard(
    {'name': "child_id_cart", 'id': 504},
  ),
  ;

  final Map<String, dynamic> key;

  const IdCartEnum(this.key);
}
