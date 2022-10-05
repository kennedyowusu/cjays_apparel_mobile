class Product {
  int? id = 0;
  String? name = '';
  String? description = '';
  String? image = '';
  String? price = '';
  int? categoryId = 0;
  String? categoryName = '';

  Product(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.price,
      this.categoryId,
      this.categoryName});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
  }
}
