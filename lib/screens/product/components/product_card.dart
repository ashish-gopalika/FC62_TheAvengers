import 'package:enduserapp/model/order_model.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final OrderModel productItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F6F9),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 88,
                child: AspectRatio(
                  aspectRatio: 0.88,
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.network("${productItem.image}"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${productItem.productName}",
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Text.rich(
                    TextSpan(
                      text: "\₹${productItem.price}",
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black45),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
