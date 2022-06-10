import 'package:flutter/material.dart';
import 'package:fc62_theavengers/screens/main.dart';
import 'package:fc62_theavengers/services/email_auth.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fc62_theavengers/screens/profile/edit_addresses.dart';
import 'package:fc62_theavengers/screens/profile/edit_profile.dart';
import 'package:fc62_theavengers/screens/profile/delete_account.dart';
import 'package:fc62_theavengers/screens/profile/menu_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            //ProfilePic(),
            const SizedBox(height: 20),
            ProfileMenu(
              text: "Edit Profile",
              press: () => {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfile()),
              ),
            },
            ),
            ProfileMenu(
              text: "Edit Addresses",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditAddresses()),
                );
              },

            ),
            ProfileMenu(
              text: "Delete Account",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DeleteAccount()),
                );
              },
            ),
            ProfileMenu(
              text: "Contact us",
              press: () {
                _callNumber();
              },
            ),
            ProfileMenu(
              text: "Log Out",
              press: () {
                EmailAuth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

_callNumber() async {
  String number = "+91123456789";
  await FlutterPhoneDirectCaller.callNumber(number);
}






