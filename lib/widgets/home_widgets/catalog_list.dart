import 'package:flutter/material.dart';
import 'package:new_project/Pages/home_detail_page.dart';

import 'package:new_project/models/catlog.dart';

import 'package:velocity_x/velocity_x.dart ';

import 'add_to_cart.dart';
import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatlogModel.items[index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(catalog: catalog),
            ),
          ),
          child: CatalogItem(catalog: catalog),
        );
      },
      itemCount: CatlogModel.items.length,
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Items catalog;
  const CatalogItem({
    Key? key,
    required this.catalog,
  }) : //assert(catalog!=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(image: catalog.image),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.bold.lg.color(context.theme.accentColor).make(),
              catalog.desc.text.color(context.accentColor).sm.make(),
              10.heightBox,
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}"
                      .text
                      .color(context.accentColor)
                      .bold
                      .xl
                      .make(),
                  AddToCart(catalog: catalog),
                ],
              ).pOnly(right: 8.0),
            ],
          ),
        ),
      ],
    )).square(150).color(context.cardColor).roundedLg.make().py16();
  }
}
