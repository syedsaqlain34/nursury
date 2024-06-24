import 'package:e_nursury/controller/Shop-Controller.dart';
import 'package:e_nursury/model/Plant_Model.dart';
import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:e_nursury/view/Shop.dart';
import 'package:e_nursury/widgets/Plant_widget.dart';
import 'package:e_nursury/widgets/constaint.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Favorite_Page.dart';
import 'Plant_detail_Page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;
  List<ShopModel> _shopList = [];
  List<ShopModel> _favoritedShops = [];
  int selectedIndex = 0;
  List<PlantModel> _plantList = [];
  @override
  void initState() {
    super.initState();
    _fetchShops();
  }

  Future<void> _fetchShops() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<ShopModel> shops = await ShopController().fetchShops();
      setState(() {
        _shopList = shops;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Error fetching shops: $e");
    }
  }

  void _toggleFavorite(ShopModel shop) {
    setState(() {
      shop.isFavorited = !shop.isFavorited;
      if (shop.isFavorited) {
        _favoritedShops.add(shop);
      } else {
        _favoritedShops.remove(shop);
      }
    });
  }

  Future<List<PlantModel>> _fetchPlantsForShop(String shopId) async {
    try {
      final querySnapshot = await FirebaseFirestore.instance
          .collection('shops')
          .doc(shopId)
          .collection('plants')
          .get();
      return querySnapshot.docs
          .map((doc) => PlantModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error fetching plants: $e");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<String> _shopTypes = [
      'Recommended',
      'Indoor',
      'Outdoor',
      'Garden',
      'Supplement',
    ];

    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              width: size.width * .9,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black54.withOpacity(.6),
                  ),
                  const Expanded(
                    child: TextField(
                      showCursor: false,
                      decoration: InputDecoration(
                        hintText: 'Search Plant',
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.mic,
                    color: Colors.black54.withOpacity(.6),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(.1),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: 50.0,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _shopTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Text(
                        _shopTypes[index],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index
                              ? FontWeight.bold
                              : FontWeight.w300,
                          color: selectedIndex == index
                              ? Constants.primaryColor
                              : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: size.height * .3,
              child: ListView.builder(
                itemCount: _shopList.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final shop = _shopList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShopDetailPage(shop: _shopList[index]),
                        ),
                      );
                    },
                    child: Container(
                      width: 200,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  shop.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              shop.isFavorited
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: shop.isFavorited
                                  ? Colors.red
                                  : Colors.grey,
                            ),
                            onPressed: () => _toggleFavorite(shop),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, bottom: 20, top: 20),
              child: const Text(
                'Recommended Plants',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              height: size.height * .5,
              child: ListView.builder(
                itemCount: _shopList.length,
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return FutureBuilder<List<PlantModel>>(
                    future: _fetchPlantsForShop(_shopList[index].id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return Center(child: Text('No Shop Avaliable'));
                      }
                      final plants = snapshot.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _shopList[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: size.height * .3,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: plants.length,
                              itemBuilder: (context, plantIndex) {
                                final plant = plants[plantIndex];
                                return PlantWidget(
                                  index: index,
                                  plantList: _plantList,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailPage(plant: plant),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(favoritedShops: _favoritedShops),
            ),
          );
        },
        child: Icon(Icons.favorite),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
