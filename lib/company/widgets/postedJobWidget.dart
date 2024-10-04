import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class PostedJobWidget extends StatefulWidget {
  const PostedJobWidget({super.key});

  @override
  State<PostedJobWidget> createState() => _PostedJobWidgetState();
}

class _PostedJobWidgetState extends State<PostedJobWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,15.0),
      margin: const EdgeInsets.only(bottom: 10),
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
                icon: const Icon(Icons.radio_button_checked),
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Data Analyst",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: kfontColor
              ),),
                    Text("OVO",)
                  ],
                ),
                const Spacer(),
                IconButton(
                  onPressed: (){}, 
                  icon: const Icon(Icons.bookmark_outline)
                  )
            ],
          ),
          kheightinRec,
          const Row(
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
          const Row(
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
              // JobScreenWidget(icon: const Icon(Icons.video_camera_front,size: 18,),text: "Remote",),
              // JobScreenWidget(icon: const Icon(Icons.access_time_filled,size: 18,),text: "Internship",),
              // JobScreenWidget(icon: const Icon(Icons.business_center,size: 18,),text: "1 Year Exp",),
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
      
          const Row(
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