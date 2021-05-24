class Product {
  final String idProduct;
  final String name;
  final String description;
  final String category;
  final String price;
  final String weight;
  final List<String> images;
  final String createdAt;
  final int review;

  Product(
      {this.idProduct,
      this.name,
      this.description,
      this.category,
      this.createdAt,
      this.price,
      this.review,
      this.images,
      this.weight});

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      idProduct: json['id_product'],
      name: json['name'],
      description: json['description'],
      category: json['category'],
      price: json['price'],
      weight: json['weight'],
      images: List<String>.from(json['images']),
      createdAt: json['created_at'],
      review: json['review'],
    );
  }
}
