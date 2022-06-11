import 'package:flutter/material.dart';

import '../../../database/firestore_database.dart';
import '../../../model/cart_data.dart';

class CheckoutBody extends StatelessWidget {
  const CheckoutBody({Key? key}) : super(key: key);

  Widget getListWidget() {

    if (CartData.cartItems.isNotEmpty) {
      List<String> getPrices(){
        List<String> prices=[];
        for(var element in CartData.cartItems){
          prices.add(((int.parse(element.price!))*int.parse(element.quantity!)).toString());
        }
        return prices;
      }
      return Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20.0),
        child: ListView.builder(
          itemCount: CartData.cartItems.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(CartData.cartItems[index]
                  .uid
                  .toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                FirestoreDB.removeFromCart(CartData.cartItems[index].uid!,context,index);
              },
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
              child: Row(
                children: [
                  Text('${CartData.cartItems[index].productName} x '),
                  Text('${CartData.cartItems[index].quantity}'),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child:
                      Text('\₹${getPrices()[index]}',
                        style:const  TextStyle(

                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return const Center(
      child: Text(
        "Cart is Empty",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black54,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return getListWidget();
  }
}
