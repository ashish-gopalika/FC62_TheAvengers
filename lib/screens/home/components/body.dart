import 'package:enduserapp/screens/home/components/top_store.dart';
import 'package:flutter/material.dart';

import 'categories.dart';


class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Categories(),
          TopStore(),
          SizedBox(height: 50),
          SizedBox(height: 70),
        ],
      ),
    );
  }
}
