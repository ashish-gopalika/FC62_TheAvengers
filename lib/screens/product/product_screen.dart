import 'package:enduserapp/screens/product/product_item_wrapper.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key, required this.category}) : super(key: key);
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          category,
          style: const TextStyle(
              letterSpacing: 2
          ),
        ),
        centerTitle: true,
        leading: null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15,),
              Expanded(child: ProductItemWrapper(category: category,)),
            ],
          ),
        ),
      ),
    );
  }
}
