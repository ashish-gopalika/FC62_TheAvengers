import 'package:enduserapp/screens/orders/components/body.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'My Orders',
          style: TextStyle(
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
            children: const [
               SizedBox(height: 15,),
               SizedBox(height: 15,),
               Expanded(child: OrderBody()),
            ],
          ),
        ),
      ),
    );
  }
}
