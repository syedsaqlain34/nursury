import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:flutter/material.dart';

class ShopDetailPage extends StatelessWidget {
  final ShopModel shop;

  const ShopDetailPage({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display shop details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Shop Details:'),
            ),
            // Example: Display shop name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Name: ${shop.name}'),
            ),
            // Display plants added to the shop
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Plants:'),
            ),
            // Example: Display plants in a ListView
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: shop.plants.length,
              itemBuilder: (context, index) {
                final plant = shop.plants[index];
                return ListTile(
                  title: Text(plant.PlantName),
                  subtitle: Text('Price: \$${plant.price.toString()}'),
                  // You can add more details here
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
