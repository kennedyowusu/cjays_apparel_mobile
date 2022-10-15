class ProductsCategory {
  int? id;
  int? categoryId;
  String? name;
  String? description;
  String? image;
  int? price;
  int? isRecommended;
  int? isPopular;
  String? createdAt;
  String? updatedAt;

  ProductsCategory(
      {this.id,
      this.categoryId,
      this.name,
      this.description,
      this.image,
      this.price,
      this.isRecommended,
      this.isPopular,
      this.createdAt,
      this.updatedAt});

  ProductsCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    isRecommended = json['is_recommended'];
    isPopular = json['is_popular'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['price'] = price;
    data['is_recommended'] = isRecommended;
    data['is_popular'] = isPopular;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
