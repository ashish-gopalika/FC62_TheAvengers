import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../model/order_data.dart';
import 'oder_card.dart';

class OrderBody extends StatefulWidget {
  const OrderBody({Key? key}) : super(key: key);

  @override
  _OrderBodyState createState() => _OrderBodyState();
}

class _OrderBodyState extends State<OrderBody> {


  Widget getListWidget() {
    if (Provider.of<OrderData>(context).getOrderItems.isNotEmpty) {
      return ListView.builder(
        itemCount: Provider.of<OrderData>(context).getOrderItems.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(Provider.of<OrderData>(context)
                .getOrderItems[index]
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
            child: OrderCard(
                order: Provider.of<OrderData>(context).getOrderItems[index]),
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
