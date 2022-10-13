// class Product {
//   int? id = 0;
//   String? name = '';
//   String? description = '';
//   String? image = '';
//   String? price = '';
//   int? categoryId = 0;
//   String? categoryName = '';

//   Product(
//       {this.id,
//       this.name,
//       this.description,
//       this.image,
//       this.price,
//       this.categoryId,
//       this.categoryName});

//   Product.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     image = json['image'];
//     price = json['price'];
//     categoryId = json['category_id'];
//     categoryName = json['category_name'];
//   }
// }
class Product {
  int? id = 0;
  String? name = '';
  String? description = '';
  String? image = '';
  String? price = '';
  int? categoryId = 0;
  String? categoryName = '';
  bool? isRecommended = false;
  bool? isPopular = false;

  Product(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryId,
      this.categoryName,
      this.isRecommended,
      this.isPopular});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    isRecommended = json['is_recommended'].toString() == '1' ? true : false;
    isPopular = json['is_popular'].toString() == '1' ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['is_recommended'] = isRecommended;
    data['is_popular'] = isPopular;
    return data;
  }
}
