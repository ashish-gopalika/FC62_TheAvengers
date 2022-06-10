import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/model/order_model.dart';
import 'package:enduserapp/model/product_model.dart';
import 'package:enduserapp/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productItem})
      : super(key: key);
  final ProductModel productItem;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {

    int cartIndex=0;

    List<Widget> getStars() {
      List<Widget> stars = [];
      int numberStar = 5;
      while (numberStar != 0) {
        stars.add(const Icon(
          Icons.star,
          color: Colors.grey,
        ));
        numberStar--;
      }
      numberStar = int.parse(widget.productItem.rating!);
      while (numberStar != 0) {
        stars.removeLast();
        stars.insert(
            0,
            const Icon(
              Icons.star,
              color: Colors.yellow,
            ));
        numberStar--;
      }
      return stars;
    }

    int getNumberOfItem(String productId) {
      int count = 0;
      cartIndex=0;
      for (OrderModel item in Provider.of<CartData>(context).getCartItems) {
        if (item.productUid == productId) {
          count++;
          break;
        }
        cartIndex++;
      }
      return count;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 350,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 20),
                      child: Row(
                        children: [
                          Text(
                            widget.productItem.productName!,
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
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    widget.productItem.image!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text.rich(
                      TextSpan(
                        text: "M.R.P ",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black45,
                            fontSize: 25),
                        children: [
                          TextSpan(
                            text: "\₹${widget.productItem.price}",
                            style: const TextStyle(
                                color: Colors.red, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250.0,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: (getNumberOfItem(widget.productItem.uid!) == 0)?() {
                      String uidGenerate=UserData.endUserModel.uid!+(FirestoreDB.cartCount++).toString();
                      Provider.of<CartData>(context, listen: false).addToCart(OrderModel(price: widget.productItem.price,quantity: '1',uid: uidGenerate,productName: widget.productItem.productName,productUid: widget.productItem.uid,time: DateTime.now().toString(),image: widget.productItem.image));
                      FirestoreDB.addToCart(OrderModel(price: widget.productItem.price,quantity: '1',uid: uidGenerate,productName: widget.productItem.productName,productUid: widget.productItem.uid,time: DateTime.now().toString(),image: widget.productItem.image));
                    }:null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (getNumberOfItem(widget.productItem.uid!) != 0)
                        ? () {
                      print('add');
                            Provider.of<CartData>(context, listen: false).updateAddQuantity(cartIndex);
                            FirestoreDB.updateQuantity(CartData.cartItems[cartIndex]);
                            print(CartData.cartItems[cartIndex].productName);
                            print(CartData.cartItems[cartIndex].quantity);
                          }
                        : null,
                    child: Icon(
                      Icons.add_circle,
                      size: 25,
                      color: (getNumberOfItem(widget.productItem.uid!) != 0)?Colors.blue:Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    (getNumberOfItem(widget.productItem.uid!)==0)?'0':Provider.of<CartData>(context).getCartItems[cartIndex].quantity.toString(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: (getNumberOfItem(widget.productItem.uid!) != 0)
                        ? () {
                      if(CartData.cartItems[cartIndex].quantity!='1') {
                              Provider.of<CartData>(context, listen: false)
                                  .updateDeleteQuantity(cartIndex);
                              FirestoreDB.updateQuantity(
                                  CartData.cartItems[cartIndex]);
                            }
                      else{
                        FirestoreDB.removeFromCart(Provider.of<CartData>(context, listen: false).getCartItems[cartIndex].uid!,context,cartIndex);
                      }
                          }
                        : null,
                    child: Icon(
                      Icons.remove_circle,
                      size: 25,
                      color: (getNumberOfItem(widget.productItem.uid!) != 0)?Colors.blue:Colors.grey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 5),
                child: Row(
                  children: const [
                    Text(
                      'Description',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 5, 8, 5),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        '${widget.productItem.description}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 5),
                child: Row(
                  children: const [
                    Text(
                      'Shop Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8),
                    child: Text.rich(
                      TextSpan(
                        text: "Name ",
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                        children: [
                          TextSpan(
                            text: "${widget.productItem.shop}",
                            style: const TextStyle(
                                color: Colors.blueAccent, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 20, 8, 5),
                child: Row(
                  children: [
                    const Text(
                      'Rating',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black45,
                          fontSize: 25),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: getStars(),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
