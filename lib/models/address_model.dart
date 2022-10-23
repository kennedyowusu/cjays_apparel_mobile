class AddressModel {
  late int? id = 0;
  late String addressType = '';
  late String? contactPersonName = '';
  late String? contactPersonNumber = '';
  late String? address = '';
  late String? latitude = '';
  late String? longitude = '';

  AddressModel({
    this.id,
    required this.addressType,
    this.contactPersonName,
    this.contactPersonNumber,
    this.address,
    this.latitude,
    this.longitude,
  });

// From here, we are going to create a method to convert the JSON data to a Dart object.
  AddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressType = json['address_type'] ?? '';
    contactPersonName = json['contact_person_name'] ?? '';
    contactPersonNumber = json['contact_person_number'] ?? '';
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

// Next, we are going to create a method to convert the Dart object to a JSON data.
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['address_type'] = addressType;
    data['contact_person_name'] = contactPersonName;
    data['contact_person_number'] = contactPersonNumber;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
