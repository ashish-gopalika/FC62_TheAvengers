import 'package:flutter/material.dart';
import 'package:enduserapp/screens/profile/Address.dart';
class AddressCard extends StatelessWidget {
  const AddressCard({
    Key? key,
  required this.address,
  this.press,
  }) : super(key: key);
  final Address address;
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
                TextSpan(text: '\n    ${address.house_name}'),
                TextSpan(text: '\n    ${address.area}'),
                TextSpan(text: '\n    ${address.landmark}'),
                TextSpan(text: '\n    ${address.town},${address.state} ${address.pincode}'),
                TextSpan(text: '\n    ${address.country}'),
                TextSpan(text: '\n    Phone Number:${address.phonenumber}\n'),

              ],
            ),
            )
        ));
  }
}
//   class AddressCard extends StatelessWidget {
//   const AddressCard({
//   Key key,
//   this.address,
//   this.press,
//   }) : super(key: key);
//   final Address address;
//   final VoidCallback press;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(
//           horizontal: 20 / 2, vertical: 20 / 2),
//       child: InkWell(
//         onTap: press,
//         child: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       SizedBox(width: 20 / 2),
//                       Expanded(
//                         child: Text.rich(
//                           TextSpan(
//                             text: "${address.name} \n",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w500,
//                               color: Colors.black,
//                             ),
//                             children: [
//                               TextSpan(
//                                 text: address.house_name,
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Column(
//                         children: [
//                           Text(
//                             email.time,
//                             style: Theme.of(context).textTheme.caption.copyWith(
//                               color: isActive ? Colors.white70 : null,
//                             ),
//                           ),
//                           SizedBox(height: 5),
//                           if (email.isAttachmentAvailable)
//                             Image.asset(
//                               "assets/Icons/paperclip.png",
//                               color: isActive ? Colors.white70 : kGrayColor,
//                             )
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: kDefaultPadding / 2),
//                   Text(
//                     email.body,
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                     style: Theme.of(context).textTheme.caption.copyWith(
//                       height: 1.5,
//                       color: isActive ? Colors.white70 : null,
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }