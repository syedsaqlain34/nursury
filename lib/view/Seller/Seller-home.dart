import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:e_nursury/view/Seller/Add-plant.dart';
import 'package:e_nursury/view/Seller/Plant-in-Each-Shop.dart';
import 'package:flutter/material.dart';
import 'Create-shop.dart';

class HomeScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
  return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: Icon(Icons.menu),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('E - Nursury', style: TextStyle(fontSize: 16)),
            Text('Ever Green Pakistan', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage('https://example.com/user_profile.jpg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'My Shop',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNewShop('New Shop', 'to get more', Colors.green.withOpacity(0.6), Icons.account_tree, context),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'My Orders',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'SEE MORE',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
              SizedBox(height: 10),
              _buildReportCard('Hassan Ayaz', 'From', Icons.document_scanner),
              _buildReportCard('Saqlain', 'From', Icons.document_scanner),
              SizedBox(height: 20),
              Text(
                'More Shops',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: SizedBox(
                  height: 120,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('shops').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      List<ShopModel> shops = snapshot.data!.docs.map((doc) {
                        final data = doc.data() as Map<String, dynamic>;
                        return ShopModel.fromMap(data);
                      }).toList();
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: shops.map((shop) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: _MyAll_Shops(shop.name, 'Indoor Shop', shop.imageUrl, shop.id, context),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text('Book Your Appointment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget _buildNewShop(String title, String subtitle, Color color, IconData icon, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CreateShopView(),
        ),
      );
    },
    child: Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(height: 10),
          Text(title, style: TextStyle(color: Colors.white)),
          Text(subtitle, style: TextStyle(color: Colors.white, fontSize: 10)),
        ],
      ),
    ),
  );
}

Widget _buildReportCard(String title, String name, IconData icon) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.orange),
            SizedBox(width: 10),
            Text(title),
          ],
        ),
        Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ],
    ),
  );
}

Widget _MyAll_Shops(String shopName, String moto, String imageUrl, String shopId, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddPlantView(shopId: shopId)
        ),
      );
    },
    child: Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
          SizedBox(height: 10),
          Text(shopName, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(moto, style: TextStyle(color: Colors.grey)),
        ],
      ),
    ),
  );
}
}
