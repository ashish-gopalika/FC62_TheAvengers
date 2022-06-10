import 'package:enduserapp/model/shop_data.dart';
import 'package:enduserapp/screens/home/components/body.dart';
import 'package:enduserapp/screens/home/components/home_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/discount_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShopData>(
      create: (context) => ShopData(),
      child: Scaffold(
        body: Column(
          children: const [
            SizedBox(height: 30),
            HomeHeader(),
            SizedBox(height: 10),
            DiscountBanner(),
            Expanded(child: BodyHome()),
          ],
        )

      ),
    );
  }
}