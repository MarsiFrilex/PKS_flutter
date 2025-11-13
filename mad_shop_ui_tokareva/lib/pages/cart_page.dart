import 'package:flutter/material.dart';
import 'package:mad_shop_ui_tokareva/models/cart_item.dart';
import 'package:mad_shop_ui_tokareva/widgets/navbar.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CardItemModel> cardsList = [
    CardItemModel(
      imgUrl: "https://ae04.alicdn.com/kf/Sc29c6c937c054ef0b7236dcc2a21f66b4.jpg_640x640.jpg", 
      title: "Lorem ipsum", 
      description: "Pink, Size M",
      price: 17,
      onDelete: null,
    ),
    CardItemModel(
      imgUrl: "https://ae04.alicdn.com/kf/S11ffa072183849a1ae1e00a91a683afaU.jpg_640x640.jpg", 
      title: "Lorem ipsum", 
      description: "Pink, Size M",
      price: 17,
      onDelete: null,
    ),
    CardItemModel(
      imgUrl: "https://ae04.alicdn.com/kf/S3f1e20f52d4148cca9379a93bebea1ddo.jpg_640x640.jpg", 
      title: "Lorem ipsum", 
      description: "Pink, Size M",
      price: 17,
      onDelete: null,
    ),
  ];

  void _removeItem(int index) {
    setState(() {
      cardsList.removeAt(index);
    });
  }

  double get _totalPrice {
    return cardsList.fold(0, (total, item) => total + item.price);
  }

  int get _itemsCount {
    return cardsList.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Cart", 
              style: TextStyle(fontWeight: FontWeight.bold)
            ),
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFE5EbFC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _itemsCount.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Expanded(
            child: cardsList.isEmpty
                ? Center(child: Text("Cart is empty"))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: cardsList.length,
                    itemBuilder: (context, i) {
                      return CardItemModel(
                        imgUrl: cardsList[i].imgUrl,
                        title: cardsList[i].title,
                        price: cardsList[i].price,
                        description: cardsList[i].description,
                        onDelete: () => _removeItem(i),
                      );
                    }
                  ),
          ),
          if (cardsList.isNotEmpty)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xFFF3F3F3),
                border: Border(
                  top: BorderSide(color: Color(0xFFF5F5F5)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total \$$_totalPrice",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF004CFF),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 36, vertical: 20),
                    ),
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: NavBar(currentPageIndex: 2),
    );
  }
}