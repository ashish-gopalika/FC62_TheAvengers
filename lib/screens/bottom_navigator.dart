import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fc62_theavengers/screens/cart/cart_screen.dart';
import 'package:fc62_theavengers/screens/home/home_screen.dart';
import 'package:fc62_theavengers/screens/main.dart';
import 'package:fc62_theavengers/screens/orders/OrdersScreen.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:flutter/material.dart';

import 'profile/profile_screen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> with TickerProviderStateMixin {

  int _page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget pageSelector(){
    if(_page==0){
      return const HomeScreen();
    }
    else if(_page==1){
      return const CartScreen();
    }
    else if(_page==2){
      return const OrdersScreen();
    }
    else if(_page==3){
      return const ProfileScreen();
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30,color: Colors.white,),
          Icon(Icons.shopping_cart_outlined, size: 30,color: Colors.white,),
          Icon(Icons.list_alt, size: 30,color: Colors.white,),
          Icon(Icons.perm_identity, size: 30,color: Colors.white,),
        ],
        color: Colors.blueAccent,
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: pageSelector()
    );
  }
}
