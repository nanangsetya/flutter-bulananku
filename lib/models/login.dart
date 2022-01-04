class LoginResult {
  bool status;
  int id;
  String name;
  int roleId;

  LoginResult(
      {required this.status,
      required this.id,
      required this.name,
      required this.roleId});
}
