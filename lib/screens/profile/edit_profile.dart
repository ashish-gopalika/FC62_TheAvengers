import 'package:enduserapp/database/firestore_database.dart';
import 'package:enduserapp/model/user_data.dart';
import 'package:flutter/material.dart';

import '../../database/shared_preference_db.dart';
import 'profile_pic.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
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
              const SizedBox(
                height: 15,
              ),
              const ProfilePic(),
              //
              const SizedBox(
                height: 35,
              ),
              buildTextField(
                  "Full Name", UserData.endUserModel.name!, nameController),
              buildTextField("Phone Number", UserData.endUserModel.phoneNumber!,
                  phoneNameController),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
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
                    onPressed: () {
                      String name = nameController.text;
                      String phoneNumber = phoneNameController.text;

                      print(name.isNotEmpty);
                      print(phoneNumber.isNotEmpty);

                      if(name.isNotEmpty) {
                        SharedPreferenceDB.setValue('name', name);
                        UserData.endUserModel.name = name;
                      }
                      else{
                        name=UserData.endUserModel.name!;
                        SharedPreferenceDB.setValue('name', UserData.endUserModel.name);
                      }

                      if(phoneNumber.isNotEmpty){
                        SharedPreferenceDB.setValue('phoneNumber', phoneNumber);
                        UserData.endUserModel.phoneNumber = phoneNumber;
                      }
                      else{
                        phoneNumber=UserData.endUserModel.phoneNumber!;
                        SharedPreferenceDB.setValue('phoneNumber', UserData.endUserModel.phoneNumber);
                      }


                      FirestoreDB.updateProfile(UserData.endUserModel);

                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                            title: const Text('Updated'),
                            content:
                                const Text('Your profile has been updated'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ]),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      //elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
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
    String labelText, String placeholder, TextEditingController controller) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 35.0),
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(bottom: 3),
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      controller: controller,
      onSaved: (value) {
        controller.text = value!;
      },
    ),
  );
}
