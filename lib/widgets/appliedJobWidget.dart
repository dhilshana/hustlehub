import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class AppliedJobWidget extends StatefulWidget {

  String selType;
  AppliedJobWidget({super.key,required this.selType});

  @override
  State<AppliedJobWidget> createState() => _AppliedJobWidgetState();
}

class _AppliedJobWidgetState extends State<AppliedJobWidget> {

Color selTypeColor(){
  Color textColor =Colors.black;
  if(widget.selType == 'approved'){
    textColor = Colors.green;
  }
  else if(widget.selType == 'rejected'){
    textColor = Colors.red;
  }
  else if(widget.selType == 'reviewed'){
    textColor = Colors.blueAccent.shade700;
  }
  else if(widget.selType == 'in review'){
    textColor = Colors.yellow.shade700;
  }
  else if(widget.selType == 'short listed'){
    textColor = Colors.lightBlue.shade800;
  }
  return textColor;
}

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        margin: EdgeInsets.only(top: 15), // Match the margin of the container
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white, // Match the container's color
          boxShadow: [
            BoxShadow(
              color: ktextColor,
              offset: Offset(
                1.0,
                1.0,
              ),
              blurRadius: 3.0,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Colors.red,
          size: 30,
        ),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
        margin: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
                      BoxShadow(
                        color: ktextColor,
                        offset: const Offset(
                          1.0,
                          1.0,
                        ),
                        blurRadius: 3.0,
                       
                      ), 
                      ]//BoxShadow
        ),
        
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
            ),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                Text("Visual Designer",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18
                ),
                ),
                Text("Algorithma",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14
                ),
                ),
                Text("Kochi, Kerala, India (On-site)",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: ktextColor
                ),
                ),
                Text("Submitted, June 23, 2024",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: ktextColor
                ),
                ),
              ],
            ),
            Spacer(),
            Column(
             
              children: [
                Text(widget.selType.toUpperCase(),style: TextStyle(
                  color: selTypeColor(),
                  fontWeight: FontWeight.w600,
                  fontSize: 12
                ),),
                ksizedBoxHeight,
                CircleAvatar(
                  backgroundColor: kcontainerColor,
                  radius: 10,
                  child: Icon(Icons.arrow_forward_ios,size: 10,))
              ],
            )
          ],
        ),
      ),
    );
  }
}