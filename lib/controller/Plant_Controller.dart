  import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:e_nursury/model/Plant_Model.dart';

  class PlantController {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    Future<void> addPlant(
        String shopId,
        String name,
        int quantity,
        double price,
        String imageUrl,
        String description,
        String category) async {
      try {
        final plantId = _firestore.collection('shops').doc(shopId).collection('plants').doc().id;
        final plant = PlantModel(
          id: plantId,
          PlantName: name.trim(),
          quantity: quantity,
          price: price,
          //add trim() to imageUrl if not work
          imageUrl: imageUrl,
          description: description.trim(),
          category: category.trim(),
        );
        await _firestore.collection('shops').doc(shopId).collection('plants').doc(plantId).set(plant.toMap());
      } catch (e) {
        print("Error adding plant: $e");
      }
    }
    Future<List<PlantModel>> fetchPlants(String shopId) async {
      try {
        final querySnapshot = await _firestore.collection('shops').doc(shopId).collection('plants').get();
        return querySnapshot.docs.map((doc) => PlantModel.fromMap(doc.data())).toList();
      } catch (e) {
        print("Error fetching plants: $e");
        return [];
      }
    }
  }

  // Fetch plants for a specific shop
