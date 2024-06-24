import '../model/Plant_Model.dart';

class CartController {
  final List<PlantModel> _cart = [];

  List<PlantModel> get cart => _cart;

  void addToCart(PlantModel plant) {
    _cart.add(plant);
  }

  void removeFromCart(PlantModel plant) {
    _cart.remove(plant);
  }

  double get total => _cart.fold(0, (sum, plant) => sum + plant.price);
}
