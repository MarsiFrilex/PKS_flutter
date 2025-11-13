import 'package:flutter/material.dart';
import 'package:mad_shop_ui_tokareva/pages/cart_page.dart';
import 'package:mad_shop_ui_tokareva/pages/favourites_page.dart';
import 'package:mad_shop_ui_tokareva/pages/home_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.currentPageIndex});

  final int currentPageIndex;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.currentPageIndex;
  }

  void onTap(int index) {
    setState(() {
      currentPageIndex = index;
    });

    if (index == 0) redirectHome();
    if (index == 1) redirectFavourites();
    if (index == 2) redirectCart();
  }

  Future<void> redirectHome() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  Future<void> redirectFavourites() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => FavouritesPage()),
    );
  }

  Future<void> redirectCart() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CartPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentPageIndex,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      unselectedItemColor: Color(0xDD004CFF),
      selectedItemColor: Colors.black,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          label: "Товары",
          icon: Icon(Icons.home_outlined, size: 32),
        ),
        BottomNavigationBarItem(
          label: "Нравится",
          icon: Icon(Icons.favorite_outline, size: 30),
        ),
        BottomNavigationBarItem(
          label: "Корзина",
          icon: Icon(Icons.shopping_bag_outlined, size: 30),
        ),
      ],
    );
  }
}