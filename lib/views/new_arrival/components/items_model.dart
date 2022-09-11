class ItemsModel {
  ItemsModel({required this.image, required this.price});

  final String image;
  final double price;

  @override
  String toString() {
    return '{ $image, $price }';
  }
}
