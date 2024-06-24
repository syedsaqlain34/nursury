import 'package:e_nursury/model/Shop-mdel.dart';
import 'package:e_nursury/widgets/constaint.dart';
import 'package:flutter/material.dart';
import 'Seller/ShopDetail.dart';

class FavoritePage extends StatefulWidget {
  final List<ShopModel> favoritedShops;

  const FavoritePage({Key? key, required this.favoritedShops})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorited Shops'),
      ),
      body: widget.favoritedShops.isEmpty
          ? Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              child: Image.asset('assets/images/favorite.jpg'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Your favorited shops',
              style: TextStyle(
                color: Constants.primaryColor,
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: widget.favoritedShops.length,
        itemBuilder: (context, index) {
          final shop = widget.favoritedShops[index];
          return ListTile(
            title: Text(shop.name),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShopDetailPage(shop: shop),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
