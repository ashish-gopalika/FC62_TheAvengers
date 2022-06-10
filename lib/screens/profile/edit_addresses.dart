import 'package:flutter/material.dart';
import 'package:enduserapp/screens/profile/Address_Card.dart';
import 'package:enduserapp/model/address.dart';
import 'package:enduserapp/screens/profile/Add_address.dart';
class EditAddresses extends StatelessWidget {
  EditAddresses({Key? key}) : super(key: key);
  final List<Address> addresses=[Address(name:"Uttam Bindal",phonenumber: "9876543210",pincode: "735202",house_name: "C/o S.K.Electronics",area: "Dhraramsala Road",landmark: "Dhraramsala",town: "Jalpaiguri",state: "West Bengal",country: "India"),
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
              padding:const EdgeInsets.only(right: 10.0),
              child: IconButton(
                icon: const Icon(Icons.add,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Addaddress()),
                  );

                },
              )
          ),
        ],
      ),
      body:


      ListView.builder(itemCount: addresses.length,itemBuilder: (context,index){
        return Dismissible(
          background: slideRightDelete(),
          secondaryBackground: slideLeftDelete(),
          confirmDismiss: (direction) async {
              final bool res = await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content:const Text(
                          "Are you sure you want to delete this index?"),
                      actions: <Widget>[
                        TextButton(
                          child:const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),

                        TextButton(
                          child: const Text(
                            "Delete",
                            style: TextStyle(color: Colors.red),
                          ),
                          onPressed: () {
                            // TODO: Delete the item from DB etc..
                            // setState(() {
                            //   addresses.removeAt(index);
                            // });
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
              return res;
          },
          key: Key(addresses[index].name),
            child: InkWell(
            onTap: () {
              print("${addresses[index].name} clicked");
            },
            child: AddressCard(address:addresses[index])),);
      },
      ),

    );

  }
  Widget slideRightDelete() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.delete,
              color: Colors.white,
            ),
           const Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }
  Widget slideLeftDelete() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(
              Icons.delete,
              color: Colors.white,
            ),
            const Text(
              " Delete",
              style:  TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }
}
