// import 'package:enduserapp/model/order_model.dart';
// import 'package:flutter/material.dart';
//
// class ProductDetailScreen extends StatelessWidget {
//   const ProductDetailScreen({Key? key, required this.productItem}) : super(key: key);
//   final OrderModel productItem;
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:enduserapp/model/order_model.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key, required this.productItem}) : super(key: key);
  final OrderModel productItem;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20,8,20),
                    child: Row(
                      children: [
                        Text(
                          productItem.productName!,
                          style: const TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  productItem.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250.0,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.blueAccent)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 30.0, right: 30.0, top: 12, bottom: 12),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
              child: Row(
                children: const [
                  Text(
                    'Price',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${productItem.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
