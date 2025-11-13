import 'package:flutter/material.dart';

class CardItemModel extends StatefulWidget {
  const CardItemModel({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
    required this.description,
    this.onDelete,
  });

  final String imgUrl;
  final String title;
  final String description;
  final double price;
  final VoidCallback? onDelete;

  @override
  State<CardItemModel> createState() => _CardItemModelState();
}

class _CardItemModelState extends State<CardItemModel> {
  int countInCart = 1;

  void add() {
    setState(() => countInCart++);
  }

  void del() {
    if (countInCart > 1) {
      setState(() => countInCart--);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth * 0.3;
    double imageWidth = containerWidth * 0.92;
    double iconsSize = containerWidth * 0.16;

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: containerWidth,
                height: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 91, 91, 91).withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      widget.imgUrl,
                      width: imageWidth,
                      height: imageWidth,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: GestureDetector(
                  onTap: widget.onDelete,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                      size: iconsSize,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12),
          Expanded(
            child: Container(
              height: containerWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 4),
                      Text(
                        widget.description,
                        style: TextStyle(
                          fontSize: 14, 
                          color: Colors.grey[600],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: del,
                            child: Icon(
                              Icons.remove_circle_outline_rounded,
                              size: iconsSize * 1.3,
                              color: Color(0xFF004CFF),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xFF004CFF).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              "$countInCart",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF004CFF),
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: add,
                            child: Icon(
                              Icons.add_circle_outline_outlined,
                              size: iconsSize * 1.3,
                              color: Color(0xFF004CFF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}