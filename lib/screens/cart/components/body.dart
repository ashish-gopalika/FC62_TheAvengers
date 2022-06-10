import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_card.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {


  Widget getListWidget() {
    if (Provider.of<CartData>(context).getCartItems.isNotEmpty) {
      return ListView.builder(
        itemCount: Provider.of<CartData>(context).getCartItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(Provider.of<CartData>(context)
                .getCartItems[index]
                .uid
                .toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              FirestoreDB.removeFromCart(Provider.of<CartData>(context, listen: false).getCartItems[index].uid!,context,index);
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
            child: CartCard(
                cart: Provider.of<CartData>(context).getCartItems[index]),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: getListWidget(),
    );
  }
}
