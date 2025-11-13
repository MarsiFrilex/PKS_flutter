import 'package:flutter/material.dart';
import 'package:mad_shop_ui_tokareva/models/card.dart';
import 'package:mad_shop_ui_tokareva/widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CardModel> itemsList = [
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/Sc29c6c937c054ef0b7236dcc2a21f66b4.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: true,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S5f23b72c6b6341b5ad66e6a4f6a3f87dh.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: true,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S85eb712f411248fd9945dc3d4a3a8002L.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: true,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S87d5c40101d04064ac6bdef9d0f5d3afV.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: false,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/Sb85eb9b88f2249c7b8f9e0e5dcc5b720i.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: false,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S48a306968c5b47d09601bafe1e382ea5p.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: false,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S7ec4de53ba05414b8502fb034093578eV.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: false,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S11ffa072183849a1ae1e00a91a683afaU.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: false,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S3f1e20f52d4148cca9379a93bebea1ddo.jpg_640x640.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: true,
    ),
    CardModel(
      imgUrl:
          "https://ae04.alicdn.com/kf/S05ce58b0b1264a9fa8ce646369b47493R.jpg",
      title: "Lorem ipsum",
      price: 17,
      isFavourite: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text("Shop", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 12),
            Expanded(
              child: Container(
                height: 30,
                padding: EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFFE5EBFC),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  "Clothing",
                  style: TextStyle(
                    color: Color(0xFF0042E0),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.only(left: 12, right: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        itemCount: itemsList.length,
        itemBuilder: (context, i) => itemsList[i],
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 0),
    );
  }
}