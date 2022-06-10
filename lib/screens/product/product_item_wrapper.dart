import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/screens/asset_loader.dart';
import 'package:enduserapp/screens/authentication/login_screen.dart';
import 'package:enduserapp/screens/home/home_screen.dart';
import 'package:enduserapp/screens/loading_screens/loading.dart';
import 'package:enduserapp/screens/loading_screens/main_loading.dart';
import 'package:enduserapp/screens/product/components/body.dart';
import 'package:enduserapp/screens/product/product_screen.dart';
import 'package:enduserapp/services/email_auth.dart';
import 'package:flutter/material.dart';

class ProductItemWrapper extends StatefulWidget {
  const ProductItemWrapper({Key? key, required this.category}) : super(key: key);
  final String category;

  @override
  State<ProductItemWrapper> createState() => _ProductItemWrapperState();
}

class _ProductItemWrapperState extends State<ProductItemWrapper> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: FirestoreDB.loadProductByCategory(widget.category),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData && snapshot.data==true) {
          return const ProductBody();
        } else if (snapshot.hasData && snapshot.data==false) {
          return const HomeScreen();
        } else if (snapshot.hasError) {
          return  SafeArea(child: Text('${snapshot.error}'));
        } else {
          return const Loader();
        }
      },
    );
  }
}
