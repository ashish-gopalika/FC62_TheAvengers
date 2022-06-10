import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/model/product_data.dart';
import 'package:enduserapp/screens/product/product_detial_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/order_data.dart';
import 'product_card.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({Key? key}) : super(key: key);

  @override
  _ProductBodyState createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {

  Widget getListWidget() {
    if (ProductData.productList.isNotEmpty) {
      return ListView.builder(
        itemCount: ProductData.productList.length,

        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(productItem: ProductData.productList[index])),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(ProductData.productList[index]
                  .uid
                  .toString()),
              background: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6E6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: const [
                    Spacer(),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              child: ProductCard(
                  productItem: ProductData.productList[index]),
            ),
          ),
        ),
      );
    }
    return const Center(
      child: Text(
        "You haven't placed any order",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black54,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: getListWidget(),
    );
  }
}
