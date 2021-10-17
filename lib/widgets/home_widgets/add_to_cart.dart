import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_project/core/store.dart';
import 'package:new_project/models/cart.dart';
import 'package:new_project/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Items catalog;
  AddToCart({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(catalog);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
