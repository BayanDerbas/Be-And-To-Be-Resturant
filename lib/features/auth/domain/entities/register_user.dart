class RegisterUser {
  final String? fullname;
  final String? phonenumber;
  final String? role;
  final DateTime created_at;
  final DateTime updated_at;
  final int id;

  RegisterUser({
    required this.fullname,
    required this.phonenumber,
    required this.role,
    required this.created_at,
    required this.updated_at,
    required this.id,
  });
}
