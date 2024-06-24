import 'package:flutter/material.dart';
import '../model/Plant_Model.dart';
import '../widgets/constaint.dart';
import 'Favorite_Page.dart';
import 'Menu-Drawer.dart';
import 'Profile/user_profile.dart';
import 'home_screen.dart';

class RootPage extends StatefulWidget {


  const RootPage({Key? key,}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  List<PlantModel> favorites = [];
  List<PlantModel> myCart = [];
  int _bottomNavIndex = 0;
  FavoritePage _favoritePage = FavoritePage(favoritedShops: [],);
  // List of the pages
  List<Widget> _widgetOptions() {
    return [
      HomePage(),
      FavoritePage(favoritedShops: []),
      UserProfile(),
    ];
  }

  // List of the pages titles
  List<String> titleList = [
    'Home',
    'Favorite',
    'Cart',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {

    // Dummy user data
    String userName = "Hassan Ayaz";
    String userEmail = "hassanayaz@gmail.com";
    String userImageUrl = "https://www.example.com/user_image.jpg";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleList[_bottomNavIndex],
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Constants.blackColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: MenuDrawer(
        userName: userName,
        userEmail: userEmail,
        userImageUrl: userImageUrl,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: _widgetOptions(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black.withOpacity(.5),
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
            // final List<PlantModel> favoritedPlants = PlantModel.getFavoritedPlants();
            // final List<PlantModel> addedToCartPlants = PlantModel.addedToCartPlants();

            // favorites = favoritedPlants;
            // myCart = addedToCartPlants.toSet().toList();
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
