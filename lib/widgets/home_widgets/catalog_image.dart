import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CatalogImage extends StatelessWidget {
  String image;
  CatalogImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.network(image)
          .p20()
          .box
          .rounded
          .color(context.canvasColor)
          .make()
          .w32(context)
          .h15(context),
    );
  }
}
