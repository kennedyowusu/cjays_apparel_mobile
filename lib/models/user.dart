class UserModel {
  int? id = 0;
  String? name = "";
  String? email = "";
  String? phone = "";

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(
      id: jsonData['id'],
      name: jsonData['name'],
      email: jsonData['email'],
      phone: jsonData['phone'],
    );
  }
}
