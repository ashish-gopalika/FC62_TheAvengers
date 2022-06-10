import 'package:flutter/material.dart';
import 'package:enduserapp/screens/profile/Address_Card.dart';
import 'package:enduserapp/screens/profile/Address.dart';
class EditAddresses extends StatelessWidget {
  EditAddresses({Key? key}) : super(key: key);
  List<Address> addresses=[Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),
    Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),
    Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),
    Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),
    Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.blueAccent,
            height: 2.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        elevation: 0,

        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.add,
                  color: Colors.white,
                ),
                onPressed: (){

                },
              )
          ),
        ],
      ),
      body:


      ListView.builder(itemCount: addresses.length,itemBuilder: (context,index){
        return AddressCard(address:addresses[index]);
      },
      ),
    );

  }
}
