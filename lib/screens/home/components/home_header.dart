import 'package:flutter/material.dart';
// import 'package:shop_app/screens/cart/cart_screen.dart';

// import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
              height: 50,
            // width: double.infinity,
           margin: const EdgeInsets.fromLTRB(10,0,10,0),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 4,
          ),
              child: const SearchField(),
          ),
        ),
      ],
    );
  }
}