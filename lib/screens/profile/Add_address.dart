import 'package:flutter/material.dart';


class Addaddress extends StatelessWidget {
  const Addaddress({Key? key}) : super(key: key);

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
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const Text(
                "Add Address",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              //
              const SizedBox(
                height: 35,
              ),
              buildTextField("Name"),
              buildTextField("Phone Number"),
              buildTextField("PIN code"),
              buildTextField("Flat,House no.,Building name"),
              buildTextField("Road name,Area,Colony"),
              buildTextField("Landmark"),
              buildTextField("Town/City"),
              buildTextField("State"),
              buildTextField("Country"),
              const SizedBox(
                height:10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      //elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),),
                    child: const Text(
                      "SAVE",
                      style:  TextStyle(
                          fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                    ),

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildTextField(
    String labelText,) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextFormField(

      decoration: InputDecoration(

        contentPadding: const EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    ),
  );
}
