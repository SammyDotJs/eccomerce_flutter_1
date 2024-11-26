import 'package:ecommerce_app_1/components/bottom_nav_bar.dart';
import 'package:ecommerce_app_1/data/database.dart';
import 'package:ecommerce_app_1/pages/cart_page.dart';
import 'package:ecommerce_app_1/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserCartDatabase db = UserCartDatabase();
  final myCart = Hive.box("cart");
  int _selectedIndex = 0;

  @override
  void initState() {
    if (myCart.get("cart") == null) {
      db.createIniialData();
    } else {
      db.loadData();
    }
    print(myCart.get("cart"));
    super.initState();
  }

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [const ShopPage(), const CartPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[300],
      bottomNavigationBar:
          BottomNavBar(onTabChange: (index) => navigateBottomBar(index)),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Padding(
                  padding: EdgeInsets.only(left: 12.0),
                  child: Icon(Icons.menu),
                ))),
      ),
      body: _pages[_selectedIndex],
      drawer: Drawer(
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                //logo
                DrawerHeader(
                    child: Image.asset(
                  "lib/images/nike-logo.png",
                  color: Theme.of(context).colorScheme.primary,
                )),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Divider(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    title: Text(
                      "About",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0, bottom: 25.0),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Theme.of(context).colorScheme.primary,
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            )
            //other pages
          ],
        ),
      ),
    );
  }
}
