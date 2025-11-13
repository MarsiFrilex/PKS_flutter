import 'package:flutter/material.dart';

class CardModel extends StatefulWidget {
  const CardModel({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.isFavourite,
    this.isInCart = false,
    this.showCart = true,
  });

  final String imgUrl;
  final String title;
  final double price;
  final bool isFavourite;
  final bool isInCart;
  final bool showCart;

  @override
  State<CardModel> createState() => _CardModelState();
}

class _CardModelState extends State<CardModel> {
  late bool isFavourite;
  late bool isInCart;

  @override
  void initState() {
    super.initState();
    isFavourite = widget.isFavourite;
    isInCart = widget.isInCart;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = (screenWidth / 2) - 16;
    double imageWidth = containerWidth * 0.96;
    double iconsSize = containerWidth * 0.16;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: containerWidth,
          height: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 91, 91, 91).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.network(
                    widget.imgUrl, 
                    width: imageWidth,
                    height: imageWidth,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  left: 4,
                  top: 4,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      isFavourite = !isFavourite;
                    }),
                    child: Icon(
                      Icons.favorite_border_outlined,
                      color: isFavourite ? Colors.redAccent : Colors.white,
                      size: iconsSize,
                    ),
                  ),
                ),
                if (widget.showCart)
                  Positioned(
                    left: 4,
                    bottom: 6,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        isInCart = !isInCart;
                      }),
                      child: Icon(
                        Icons.shopping_bag_outlined,
                        color: isInCart ? Colors.black : Colors.white,
                        size: iconsSize,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              const SizedBox(height: 2),
              Text(
                "\$${widget.price}",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}