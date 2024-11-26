import 'package:ecommerce_app_1/models/cart.dart';
import 'package:ecommerce_app_1/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  void deleteFromCart(shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8)),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(
          widget.shoe.imagePath,
          width: 70,
          height: 70,
        ),
        title: Text(widget.shoe.name),
        subtitle: Text("\$${widget.shoe.price}"),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () => deleteFromCart(widget.shoe),
        ),
      ),
    );
  }
}
