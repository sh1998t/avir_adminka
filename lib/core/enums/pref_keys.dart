enum PrefKeys {
  accessToken(key: "accessToken"),
  refreshToken(key: "refreshToken"),
  languageSelected(key: "language");

  const PrefKeys({required this.key});

  final String key;
}


enum DocumentType{
  passport("passport"),
  ID("ID");
  final String key;

  const DocumentType(this.key);



}