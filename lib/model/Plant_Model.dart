class PlantModel {
  String id;
  String PlantName;
  int quantity;
  double price;
  String imageUrl;
  String description;
  String category;

  PlantModel({
    required this.id,
    required this.PlantName,
    required this.quantity,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': PlantName,
      'quantity': quantity,
      'price': price,
      'imageUrl': imageUrl,
      'description': description,
      'category': category,
    };
  }

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
        id: map['id'],
      PlantName: map['name'],
        quantity: map['quantity'],
        price: map['price'],
        imageUrl: map['imageUrl'],
        description: map['description'],
        category: map['category'],
    );
    }
}


