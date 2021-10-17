import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'package:new_project/core/store.dart';
import 'package:new_project/models/cart.dart';

import 'package:new_project/models/catlog.dart';
import 'package:new_project/utils/routes.dart';
import 'package:new_project/widgets/home_widgets/catalog_header.dart';
import 'package:new_project/widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // final catlogJson = await rootBundle.loadString("assets/files/catlog.json");
    final response = await http.get(Uri.parse(url));
    final catlogJson = response.body;

    final decodedJson = jsonDecode(catlogJson);

    var productsData = decodedJson["products"];

    CatlogModel.items = List.from(productsData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      floatingActionButton: VxBuilder(
        builder: (ctx, cartModel, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartRoute);
          },
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
          color: Vx.red500,
          size: 20,
          textStyle:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          count: _cart.items.length,
        ),
        mutations: {AddMutation, RemoveMutation},
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatlogModel.items.isNotEmpty)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator(
                  color: context.accentColor,
                ).centered().p16().expand(),
            ],
          ),
        ),
      ),
    );
  }
}
