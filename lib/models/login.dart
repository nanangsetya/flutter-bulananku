class LoginResult {
  bool status;
  int id;
  String name;
  String accessToken;
  String message;

  LoginResult(
      {required this.status,
      required this.id,
      required this.name,
      required this.accessToken,
      required this.message});
}
