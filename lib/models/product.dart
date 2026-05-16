class Product {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String price;
  final String image;

  Product({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      tagline: json['tagline'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
