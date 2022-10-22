class AuthModel {
  String name = '';
  String email = '';
  String phone = '';
  String password = '';
  String confirmPassword = '';

  AuthModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });

  // Method to convert the object to a Map/JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['password'] = password;
    data['password_confirmation'] = confirmPassword;
    return data;
  }
}
