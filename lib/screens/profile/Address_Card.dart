import 'package:flutter/material.dart';
import 'package:enduserapp/model/address_model.dart';
class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
  required this.address,
  this.press,
  }) : super(key: key);
  final AddressModel address;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(

            width: 380,
            //height:200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.transparent),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.grey[200],
            ),
            child:  Text.rich(TextSpan(

              children: <TextSpan>[
                TextSpan(text: '\n    ${address.name}',                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: '\n    ${address.houseName}'),
                TextSpan(text: '\n    ${address.area}'),
                TextSpan(text: '\n    ${address.landmark}'),
                TextSpan(text: '\n    ${address.town},${address.state} ${address.pinCode}'),
                TextSpan(text: '\n    ${address.country}'),
                TextSpan(text: '\n    Phone Number:${address.phoneNumber}\n'),

              ],
            ),
            )
        ));
  }
}
