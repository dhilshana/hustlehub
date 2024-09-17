import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: kcontainerColor,
          width: 1
        )
      ),
      margin: EdgeInsets.fromLTRB(20,10,20,0),
      
      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
                8), // Set border radius for rounded corners
            child: Container(
              padding: EdgeInsets.all(10),
              color: kcontainerColor, // Background color
              child: Icon(
                Icons.notifications_outlined,
                size: 23,
                color: Color.fromARGB(255, 32, 30, 30),
              ),
            ),
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text("Your Job Alert for UI/UX designer",style: TextStyle(
                  color: kfontColor
                ),
                 maxLines: 2, // Limits the text to 2 lines
                  overflow: TextOverflow.ellipsis, // Shows ellipsis if text is too long
                ),
                Text("18:36",style: TextStyle(
                  color: kfontColor
                ),)
              ],
            ),
          ),
          Icon(Icons.more_horiz)
        ],
      ),
    );
  }
}