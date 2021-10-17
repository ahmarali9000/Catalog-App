import 'package:flutter/material.dart';
import 'package:new_project/Pages/cart_page.dart';

import 'package:new_project/Pages/home_page.dart';
import 'package:new_project/Pages/login_page.dart';
import 'package:new_project/core/store.dart';
import 'package:new_project/utils/routes.dart';
import 'package:new_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    store: MyStore(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: LoginPage(),
      initialRoute: MyRoutes.homeRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.cartRoute: (context) => CartPage(),
      },
    );
  }
}
