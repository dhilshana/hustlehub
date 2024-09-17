import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/utils/controller.dart';
import 'package:hastlehub/widgets/customBotNavWidget.dart';
import 'package:hastlehub/widgets/customProgressIdicator.dart';
import 'package:hastlehub/widgets/profileDetailsWidget.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {

ProfileScreen({super.key,});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {


  final ImagePicker _picker = ImagePicker(); // Initialize the ImagePicker

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        imageFile =
            File(pickedFile.path); // Convert the picked file to a File object
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile",style: TextStyle(
            color: kfontColor,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
          centerTitle: true,
          backgroundColor: kBgColor,
          actions: [
            Icon(Icons.more_vert)
          ],
        ),
        
        backgroundColor: kBgColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ksizedBoxHeight,
              GestureDetector(
                onTap: (){
                  _pickImage();
                },
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage:imageFile != null ? FileImage(imageFile!) : null,
                ),
              ),
              kheightinRec,
              Text("Benjamin Leo",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),),
              Text("Sr.UI/UX Designer",style: TextStyle(
                fontWeight: FontWeight.w500,
                color: kfontColor
              ),),
              ksizedBoxHeight,
              Text("Complete Your Profile (1/4)",style: TextStyle(
                color: kfontColor,
                fontSize: 15
              ),),
              kheightinRec,
              CustomProgressIndicator(progress: 0.5),
              kheightinRec,
              
              SizedBox(
                height: 200,
                child: ListView(
                   scrollDirection: Axis.horizontal,
                  children:[ 
                    ProfileDetailsWidget(),
                    ProfileDetailsWidget(),
                    ProfileDetailsWidget(),
                    ProfileDetailsWidget()
                    ]),
              ),
              ksizedBoxHeight,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kcontainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.settings_outlined),
                    widthInRow,
                    Text("Settings",style: TextStyle(
                      color: kfontColor,
                      fontWeight: FontWeight.bold
                    ),),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
              kheightinRec,
              kheightinRec,
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kcontainerColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.chat_outlined),
                    widthInRow,
                    Text("Help",style: TextStyle(
                      color: kfontColor,
                      fontWeight: FontWeight.bold
                    ),),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
              ksizedBoxHeight
            ],
          ),
        ),
      ),
    );
  }
}