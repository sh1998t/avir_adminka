enum PrefKeys {
  accessToken(key: "accessToken"),
  refreshToken(key: "refreshToken"),
  languageSelected(key: "language");

  const PrefKeys({required this.key});

  final String key;
}

enum DocumentType {
  passport({
    "name": "passport",
    "id": 1,

  }),
  id({
    "name": "ID",
    "id": 1,

  });

  final Map<String, dynamic> key;

  const DocumentType(this.key);
}
