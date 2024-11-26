import "package:ecommerce_app_1/models/shoe.dart";
import "package:hive_flutter/hive_flutter.dart";

class UserCartDatabase {
  List<Shoe> userCart = [];
  // referencing the cart
  final _myCart = Hive.box("cart");

  // initial data
  void createIniialData() {
    userCart = [];
  }

  // load data from database
  void loadData() {
    userCart = _myCart.get("cart");
    print(userCart);
  }

  // update data in database
  void updateDatabase() {
    _myCart.put("cart", userCart);
  }
}
