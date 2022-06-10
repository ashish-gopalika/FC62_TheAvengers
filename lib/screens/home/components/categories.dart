import 'package:enduserapp/screens/product/product_screen.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": Icons.coronavirus_outlined, "text": "Covid Care"},
      {"icon": Icons.local_drink_outlined, "text": "Health Drinks"},
      {"icon": Icons.fitbit, "text": "Diabetes Care"},
      {"icon": Icons.healing_sharp, "text": "First Aid"},
      {"icon": Icons.medical_services_outlined, "text": "View More"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"].replaceFirst(RegExp(' '), '\n'),
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProductScreen(category: categories[index]["text"])),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? text;
  final IconData? icon;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 55,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center,style: const TextStyle(
              fontSize: 12
            ),),
          ],
        ),
      ),
    );
  }
}