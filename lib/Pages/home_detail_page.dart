import 'package:flutter/material.dart';
import 'package:new_project/models/catlog.dart';
import 'package:new_project/widgets/home_widgets/add_to_cart.dart';

import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Items catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.red600.bold.xl4.make(),
            AddToCart(catalog: catalog).wh(120, 50),
          ],
        ).p32(),
      ),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                edge: VxEdge.TOP,
                arcType: VxArcType.CONVEY,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.desc.text.xl.make(),
                      10.heightBox,
                      SingleChildScrollView(
                        child:
                            "Clita elitr sed Voluptua magna amet et dolore rebum, dolor sit labore ut vero stet et sea invidunt. Voluptua sea lorem consetetur consetetur. Rebum ut at est sed at. Sanctus."
                                .text
                                .color(context.accentColor)
                                .make()
                                .p16(),
                      ),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
