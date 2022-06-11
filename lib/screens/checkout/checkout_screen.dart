import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/order_model.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/model/user_data.dart';
import 'package:enduserapp/screens/cart/components/body.dart';
import 'package:enduserapp/screens/checkout/checkout_screen.dart';
import 'package:enduserapp/screens/checkout/components/checkout_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext Context=context;

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

              // Provider.of<UserData>(context).getCartItems.isNotEmpty
              Row(
                children: const [
                  Text("Order Summary",style: TextStyle(
                    fontSize: 35,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
              const SizedBox(height: 20,),
              const Expanded(child: CheckoutBody()),
              Row(
                children: [
                  const Text(
                    'Total  ',
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
              const SizedBox(height: 20,),
              const Align(alignment: Alignment.topLeft,child: Text('Address',style: TextStyle(fontSize: 28),)),
              const SizedBox(height: 15,),
              Align(alignment: Alignment.topLeft,child: Text('${UserData.endUserModel.name}'),),
              Align(alignment: Alignment.topLeft,child: Text('${UserData.endUserModel.phoneNumber}'),),
              Expanded(child: Align(alignment: Alignment.topLeft,child: Text('${UserData.endUserModel.address}'),),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 250.0,
                  height: 60,
                  child: ElevatedButton(
                    onPressed:(Provider.of<CartData>(context).getCartItems.isNotEmpty)?(){
                      FirestoreDB.moveToOrders();
                      Provider.of<CartData>(Context,listen: false).clearCart();
                      FirestoreDB.cartCount=0;
                      Navigator.pop(context);
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
                        "Buy",
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
            ],
          ),
        ),
      ),
    );
  }
}

