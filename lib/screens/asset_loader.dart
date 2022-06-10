import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/order_data.dart';
import 'package:enduserapp/screens/loading_screens/main_loading.dart';
import 'package:enduserapp/screens/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/shop_data.dart';
import 'bottom_navigator.dart';

class AssetLoader extends StatefulWidget {
  const AssetLoader({Key? key}) : super(key: key);

  @override
  State<AssetLoader> createState() => _AssetLoaderState();
}

class _AssetLoaderState extends State<AssetLoader> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderData>(
      create: (context) => OrderData(),
      child: FutureBuilder<bool?>(
        future: FirestoreDB.loadAssets(context),
        builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
          if (snapshot.data==true) {
            return const BottomNavigator();
          } else if (snapshot.hasError) {
            return SafeArea(child: Text('${snapshot.error}'));
          } else {
            return const MainLoader();
          }
        },
      ),
    );
  }
}
