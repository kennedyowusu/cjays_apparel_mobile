class User {
  int? id;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  int? phone;
  String? address;
  String? location;

  User(
      {this.id,
      this.firstName,
      this.lastName,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.location});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['username'] = username;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['location'] = location;
    return data;
  }
}
