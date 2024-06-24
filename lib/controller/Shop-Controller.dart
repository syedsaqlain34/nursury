import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:e_nursury/model/Plant_Model.dart';

class ShopController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<ShopModel>> fetchShops() async {
    final querySnapshot = await _firestore.collection('shops').get();
    return querySnapshot.docs.map((doc) {
      final shopData = doc.data();
      final List<PlantModel> plants = (shopData['plants'] as List<dynamic>).map((plantData) {
        return PlantModel.fromMap(plantData as Map<String, dynamic>);
      }).toList();
      return ShopModel.fromMap(shopData as Map<String, dynamic>);
    }).toList();
  }



  Future<void> createShop(
      String name,
      String imageUrl,
      GeoPoint location,
      List<PlantModel> plants,
      ) async {
    final shop = ShopModel(
      id: _firestore.collection('shops').doc().id,
      name: name.toString().trim(),
      // add trim() to the imageURl of not worked
      imageUrl: imageUrl,
      location: location,
      plants: plants,
    );
    await _firestore.collection('shops').doc(shop.id).set(shop.toMap());
  }
}
