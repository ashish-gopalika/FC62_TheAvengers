import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:enduserapp/model/cart_data.dart';
import 'package:enduserapp/screens/cart/cart_screen.dart';
import 'package:enduserapp/screens/home/home_screen.dart';
import 'package:enduserapp/screens/orders/orders_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return SafeArea(
      child: Scaffold(
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
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: pageSelector()
      ),
    );
  }
}