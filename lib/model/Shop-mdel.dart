import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_nursury/model/Plant_Model.dart';

class ShopModel {

  String id;
  String name;
  String imageUrl;
  GeoPoint location;
  bool isFavorited;
  final List<PlantModel> plants;

  ShopModel( {required this.plants, required this.id, required this.name, required this.imageUrl, required this.location, this.isFavorited = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'location': location,
      'isFavorited': isFavorited,
      'plants': plants.map((plant) => plant.toMap()).toList(),
    };
  }
  factory ShopModel.fromMap(Map<String, dynamic> map) {
    return ShopModel(
      id: map['id'],
      name: map['name'],
      imageUrl: map['imageUrl'],
      location: map['location'],
      isFavorited: map['isFavorited'] ?? false,
      plants: List<PlantModel>.from(map['plants'].map((plantMap) => PlantModel.fromMap(plantMap))),
    );
  }
}
