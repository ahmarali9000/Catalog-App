import 'package:flutter/material.dart';
import 'package:new_project/core/store.dart';
import 'package:new_project/models/cart.dart';

import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            mutations: {RemoveMutation},
            notifications: {},
            // ignore: non_constant_identifier_names
            builder: (context, CartModel, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported".text.make(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            child: "Buy".text.white.make(),
          ),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show"
            .text
            .color(context.accentColor)
            .bold
            .xl3
            .makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: Icon(
                Icons.done,
                color: context.accentColor,
              ),
              trailing: IconButton(
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                  //setState(() {});
                },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: context.accentColor,
                ),
              ),
              title: _cart.items[index].name.text
                  .color(context.accentColor)
                  .make(),
            ),
            itemCount: _cart.items.length,
          );
  }
}
