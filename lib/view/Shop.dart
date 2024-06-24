import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:e_nursury/view/Plant_detail_Page.dart';
import 'package:e_nursury/widgets/Plant_widget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
// Create a new screen to display the plants in a shop
class ShopDetailPage extends StatelessWidget {
  final ShopModel shop;
  const ShopDetailPage({Key? key, required this.shop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shop.name),
      ),
      body: ListView.builder(
        itemCount: shop.plants.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Implement navigation to plant details page
              Navigator.push(
                context,
                PageTransition(
                  child: DetailPage(
                    plant: shop.plants[index],
                  ),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: PlantWidget(
              index: index,
              plantList: shop.plants, onPressed: () {

            },
            ),
          );
        },
      ),
    );
  }
}
