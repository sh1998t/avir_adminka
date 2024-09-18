enum ReasonIdCardEnum {
  swap({
    'name': "document_swap",
    "id": 1,
  }),
  lost({
    'name': "document_lost",
    "id": 2,
  }),
  acceptance({
    'name': "document_acceptance",
    "id": 3,
  }),
  birthCertificate({
    'name': "document_birthCertificate",
    "id": 6,
  }),
  recognitionCitizenship({
    'name': "document_recognition_citizenship",
    "id": 8,
  }),
  invalid({
    'name': "document_invalid",
    "id": 25,
  }),
  error({
    'name': "document_error",
    "id": 69,
  }),
  FBShSwap({
    'name': "document_FBSh_swap",
    "id": 100,
  }),
  FBSHFirst({
    'name': "document_FBSh_first",
    "id": 104,
  }),
  foreignSwap({
    'name': "document_foreign_swap",
    "id": 200,
  }),
  foreignFirstTime({
    'name': "document_first_time",
    "id": 204,
  }),
  babyId({
    'name': "document_baby_id",
    "id": 300,
  }),
  babySwap({
    'name': "document_baby_swap",
    "id": 301,
  }),
  personalNumber({
    'name': "document_personal_number",
    "id": 305,
  });

  final Map<String, dynamic> key;

  const ReasonIdCardEnum(this.key);
}
