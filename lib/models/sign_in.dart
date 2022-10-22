class SignInModel {
  String email, password;

  SignInModel({
    required this.email,
    required this.password,
  });

  // Method to convert the object to a Map/JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}