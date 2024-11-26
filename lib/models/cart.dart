import 'package:ecommerce_app_1/data/database.dart';
import 'package:ecommerce_app_1/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  UserCartDatabase db = UserCartDatabase();

  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "ZOOM Freak",
        price: "236",
        imagePath: "lib/images/nike-1.png",
        description:
            "The forward-thinking design of his latest signature shoe"),
    Shoe(
        name: "Air Jordans",
        price: "220",
        imagePath: "lib/images/nike-2.png",
        description:
            "You've got the hops and the speed-lace up in shoes that enhance"),
    Shoe(
        name: "KD Treys",
        price: "260",
        imagePath: "lib/images/nike-3.png",
        description: "THe forward-thinking design of his latest signature shoe")
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get list of shoes for sale

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return db.userCart;
  }

  // add items to cart
  void addItemToCart(Shoe shoe) {
    if (db.userCart.contains(shoe)) {
    } else {
      db.userCart.add(shoe);
    }
    db.updateDatabase();

    notifyListeners();
  }

  // remove items from cart
  void removeItemFromCart(Shoe shoe) {
    db.userCart.remove(shoe);
    db.updateDatabase();
    notifyListeners();
  }
}
