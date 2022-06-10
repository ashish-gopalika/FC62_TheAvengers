import 'package:enduserapp/model/shop_data.dart';
import 'package:enduserapp/model/shop_model.dart';
import 'package:enduserapp/screens/home/shop_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'section_title.dart';

class TopStore extends StatelessWidget {
  const TopStore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    dynamic getListViewWidget() {
      List<TopStoreCard> cardList=[];
      if (Provider.of<ShopData>(context).getShop.isNotEmpty) {
        for(ShopModel shop in Provider.of<ShopData>(context).getShop){
          cardList.add(TopStoreCard(
            image: shop.image!,
            shopName: shop.shopName!,
            shopRating: int.parse(shop.rating!),
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ShopDetailScreen(shopDetail: shop)),
              );
            },
          ));
        }
        return cardList;
      }
      return const [Center(
        child: Text(
          "No Shops Available",
          style: TextStyle(
            fontSize: 25,
            color: Colors.black54,
          ),
        ),
      )];
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SectionTitle(
              title: "Top stores",
              press: () {},
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: getListViewWidget(),
          )
        ],
      ),
    );
  }
}

class TopStoreCard extends StatelessWidget {
  const TopStoreCard({
    Key? key,
    required this.shopName,
    required this.image,
    required this.shopRating,
    required this.press,
  }) : super(key: key);

  final String shopName, image;
  final int shopRating;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: GestureDetector(
          onTap: press,
          child: SizedBox(
            width: 330,
            height: 190,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 58,
                          child: Container(
                            color: Colors.blueAccent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Text.rich(
                                TextSpan(
                                  style: const TextStyle(color: Colors.white),
                                  children: [
                                    TextSpan(
                                      text: "$shopName\n",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: "$shopRating Rating")
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Image.network(
                            image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
