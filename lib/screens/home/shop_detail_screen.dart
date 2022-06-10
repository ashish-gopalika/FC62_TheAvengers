import 'package:enduserapp/model/shop_model.dart';
import 'package:flutter/material.dart';

class ShopDetailScreen extends StatelessWidget {
  const ShopDetailScreen({Key? key, required this.shopDetail}) : super(key: key);
  final ShopModel shopDetail;
  @override
  Widget build(BuildContext context) {

    List<Widget> getStars(){
      List<Widget> stars=[];
      int numberStar = 5;
      while(numberStar!=0){
        stars.add(const Icon(Icons.star,color: Colors.grey,));
        numberStar--;
      }
      numberStar = int.parse(shopDetail.rating!);
      while(numberStar!=0){
        stars.removeLast();
        stars.insert(0,const Icon(Icons.star,color: Colors.yellow,));
        numberStar--;
      }
      return stars;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(8.0,20,8,20),
                    child: Row(
                      children: [
                        Text(
                          shopDetail.shopName!,
                          style: const TextStyle(
                            fontSize: 33.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: Image.network(
                  shopDetail.image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 250.0,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const LoginScreen()),
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                    shape:
                    MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.blueAccent)),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                        left: 32.0, right: 32.0, top: 12, bottom: 12),
                    child: Text(
                      "View Stock",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
              child: Row(
                children: const [
                  Text(
                      'Location',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 21,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${shopDetail.address}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
              child: Row(
                children: const [
                  Text(
                    'Description',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      '${shopDetail.description}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,8.0,8.0,0.0),
              child: Row(
                children: [
                  const Text(
                    'Rating',
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 21,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Row(
                    children: getStars(),
                  ),
                ],
              ),
            ),
            const SizedBox(
             height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
