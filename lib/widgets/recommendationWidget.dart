import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/jobdetailsWidget.dart';

class RecommendationWidget extends StatefulWidget {
  const RecommendationWidget({super.key});

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,15.0),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: kcontainerColor,
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: (){}, 
                icon: Icon(Icons.radio_button_checked),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Data Analyst",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kfontColor
              ),),
                    Text("OVO",)
                  ],
                ),
                Spacer(),
                IconButton(
                  onPressed: (){}, 
                  icon: Icon(Icons.bookmark_outline)
                  )
            ],
          ),
          kheightinRec,
          Row(
            children: [
              Icon(Icons.location_on,size: 20,),
              widthInRow,
              Text("Singapore",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kfontColor
              ),)
            ],
          ),
          kheightinRec,
          Row(
            children: [
              Icon(Icons.paid,size: 20,),
              SizedBox(width: 10,),
              Text("\$400 - \$900",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kfontColor
              ),)
            ],
          ),
          kheightinRec,
          kheightinRec,
          Row(
            children: [
              JobScreenWidget(icon: Icon(Icons.video_camera_front,size: 18,),text: "Remote",),
              JobScreenWidget(icon: Icon(Icons.access_time_filled,size: 18,),text: "Internship",),
              JobScreenWidget(icon: Icon(Icons.business_center,size: 18,),text: "1 Year Exp",),
            ],
          ),
          kheightinRec,
          kheightinRec,
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ktextColor,width: 0.5)
            ),
          ),
          kheightinRec,
      
          Row(
            children: [
              Icon(Icons.history,size: 18,color: ktextColor,),
              SizedBox(width: 10,),
              Text("1 Day ago - ",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: ktextColor
              ),),
              Text("12 Applications",style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: kshowAllColor,
              ),)
            ],
          ),
        ],
      ),
    );
  }
}