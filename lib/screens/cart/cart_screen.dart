import 'package:enduserapp/model/order_model.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/screens/cart/components/body.dart';
import 'package:enduserapp/screens/checkout/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int getSum(){
      int sum=0;
      for(OrderModel element in Provider.of<CartData>(context).getCartItems){
        sum=sum+((int.parse(element.price!))*int.parse(element.quantity!));
      }
      return sum;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
            'CART',
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
            children: [
              Row(
                children: [
                  const Text(
                      'Subtotal  ',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    '\₹${getSum().toString()}',
                    style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15,),
              // Provider.of<UserData>(context).getCartItems.isNotEmpty
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250.0,
                  height: 60,
                  child: ElevatedButton(
                    onPressed:(Provider.of<CartData>(context).getCartItems.isNotEmpty)?(){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CheckoutScreen()),
                      );
                    }:null,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 12, bottom: 12),
                      child: Text(
                        "Proceed to Buy",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              const Expanded(child: Body()),
            ],
          ),
        ),
      ),
    );
  }
}

