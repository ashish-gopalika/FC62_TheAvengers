import 'package:flutter/material.dart';
import 'package:enduserapp/screens/profile/profile_pic1.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
class EditProfilePicture extends StatefulWidget {
  const EditProfilePicture({Key? key}) : super(key: key);

  @override
  State<EditProfilePicture> createState() => _EditProfilePictureState();
}

class _EditProfilePictureState extends State<EditProfilePicture> {

  File? image;

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if(image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }

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
        child: ListView(
          children: [

            Container(
              width: 130,
              height: 130,
              child: image != null ? CircleAvatar(
                child: Image.file(image!,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ): Center(child: Text("No image selected")),
              // decoration: BoxDecoration(
              //     border: Border.all(
              //         width: 4,
              //         color: Theme.of(context).scaffoldBackgroundColor),
              //     boxShadow: [
              //       BoxShadow(
              //           spreadRadius: 2,
              //           blurRadius: 10,
              //           color: Colors.black.withOpacity(0.1),
              //           offset: const Offset(0, 10))
              //     ],
              //     shape: BoxShape.circle,
              //     image: const DecorationImage(
              //         fit: BoxFit.cover,
              //         image:  NetworkImage(
              //           "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
              //         )
              //     )),
            ),
            const SizedBox(
              height: 50,
            ),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [


                IconButton(onPressed: () {
                  pickImage();
                },
                    icon: const Icon(Icons.add_photo_alternate ,
                      color: Colors.blueAccent,
                      size: 36.0,),
                    padding: const EdgeInsets.symmetric(horizontal: 50)),
                IconButton(onPressed: () {
                  pickImageC();
                },
                    icon: const Icon(Icons.camera_alt,
                      color: Colors.blueAccent,
                      size: 36.0,),
                    padding: const EdgeInsets.symmetric(horizontal: 50)),

              ],
            ),
            const SizedBox(
              height:350,
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
    );
  }
}
