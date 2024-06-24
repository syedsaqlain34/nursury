import 'package:flutter/material.dart';
import '../model/Plant_Model.dart';

class DetailPage extends StatelessWidget {
  final PlantModel plant;

  const DetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.PlantName),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(plant.imageUrl),
            Text(plant.PlantName, style: TextStyle(fontSize: 24)),
            Text('Price: Rs ${plant.price}', style: TextStyle(fontSize: 20)),
            Text(plant.category, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
