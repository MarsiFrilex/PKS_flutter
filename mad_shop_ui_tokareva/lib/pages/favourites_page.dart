import 'package:flutter/material.dart';
import 'package:mad_shop_ui_tokareva/models/card.dart';
import 'package:mad_shop_ui_tokareva/widgets/navbar.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({super.key});

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  List<CardModel> cardsList = [
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/Sc29c6c937c054ef0b7236dcc2a21f66b4.jpg_640x640.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/S5f23b72c6b6341b5ad66e6a4f6a3f87dh.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/S85eb712f411248fd9945dc3d4a3a8002L.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/S11ffa072183849a1ae1e00a91a683afaU.jpg_640x640.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/S3f1e20f52d4148cca9379a93bebea1ddo.jpg_640x640.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
    CardModel(imgUrl: "https://ae04.alicdn.com/kf/S05ce58b0b1264a9fa8ce646369b47493R.jpg", title: "Lorem ipsum", price: 17, isFavourite: true, showCart: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favourites",
          style: TextStyle(fontWeight: FontWeight.bold)
        )
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: cardsList.length,
        itemBuilder: (context, i) => cardsList[i],
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 1),
    );
  }
}