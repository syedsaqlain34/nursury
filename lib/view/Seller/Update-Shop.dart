import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../model/Plant_Model.dart';



class ShopDetailScreen extends StatelessWidget {
  final String shopId;
  final String shopName;

  ShopDetailScreen({required this.shopId, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('shops').doc(shopId).collection('plants').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          List<PlantModel> plants = snapshot.data!.docs.map((doc) => PlantModel.fromMap(doc.data() as Map<String, dynamic>)).toList();
          return ListView.builder(
            itemCount: plants.length,
            itemBuilder: (context, index) {
              PlantModel plant = plants[index];
              return ListTile(
                leading: Image.network(plant.imageUrl),
                title: Text(plant.PlantName),
                subtitle: Text('\$${plant.price.toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
