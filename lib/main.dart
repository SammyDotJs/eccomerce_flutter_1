import 'package:ecommerce_app_1/models/cart.dart';
import 'package:ecommerce_app_1/pages/home_page.dart';
import 'package:ecommerce_app_1/pages/intro_page.dart';
import 'package:ecommerce_app_1/pages/more_items.dart';
import 'package:ecommerce_app_1/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  // initializing hive
  await Hive.initFlutter();

  //open a box
  var cart = await Hive.openBox("cart");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/homepage': (context) => HomePage(),
          '/moreItems': (context) => MoreItems()
        },
        theme: lightMode,
        darkTheme: darkMode,
      ),
    );
  }
}
