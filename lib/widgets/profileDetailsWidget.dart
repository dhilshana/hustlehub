import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/textButtonWidget.dart';

class ProfileDetailsWidget extends StatefulWidget {
  const ProfileDetailsWidget({super.key});

  @override
  State<ProfileDetailsWidget> createState() => _ProfileDetailsWidgetState();
}

class _ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kcontainerColor,
        borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.of(context).size.width/3,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.account_circle_outlined,color: kfontColor,),
          ),
          kheightinRec,
          Text("Set Your Profile Details",style: TextStyle(
            color: kfontColor,
            fontWeight: FontWeight.bold
          ),),
          kheightinRec,
          TextButtonWidget(text: "Complete")
        ],
      ),
    );
  }
}