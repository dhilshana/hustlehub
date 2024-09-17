import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/sortModalSheetWidget.dart';

class SortOptionWidget extends StatelessWidget {
  const SortOptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero
                ),
            context: context,
            builder: (BuildContext context) {
              return SortModalSheetWidget();
            },
          );
            },
            child: Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
                    decoration: BoxDecoration(
            color: kcontainerColor,
            borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
            children: [
              
              SizedBox(width: 5,),
              Text("Sort",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),),
              Icon(Icons.keyboard_arrow_down)
            ],
                    ),
                  ),
          ),
      Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
        decoration: BoxDecoration(
          color: kcontainerColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Icon(Icons.location_on,size: 18,),
            SizedBox(width: 5,),
            Text("Singapore",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),),
            
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
        decoration: BoxDecoration(
          color: kcontainerColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Icon(Icons.video_camera_front,size: 18,),
            SizedBox(width: 5,),
            Text("Remote",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),),
            
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 10),
        padding: EdgeInsets.only(left: 8,right: 8,top: 3,bottom: 3),
        decoration: BoxDecoration(
          color: kcontainerColor,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          children: [
            Icon(Icons.access_time_filled,size: 18,),
            SizedBox(width: 5,),
            Text("Internship",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),),
            
          ],
        ),
      ),
        ],
      ),
    );
  }
}