import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/textButtonWidget.dart';

class TopCompaniesWidget extends StatefulWidget {
  const TopCompaniesWidget({super.key});

  @override
  State<TopCompaniesWidget> createState() => _TopCompaniesWidgetState();
}

class _TopCompaniesWidgetState extends State<TopCompaniesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 20, 10,0),
      margin: EdgeInsets.only(right: 10,),
      width: MediaQuery.of(context).size.width/1.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(
          color: kcontainerColor,
        )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(),
              widthInRow,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tokopedia",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kfontColor,
              fontSize: 16
                  ),),
                  // kheightinRec,
                  Text("Indonesia",style: TextStyle(
                    fontSize: 14,
                    color: ktextColor
                  ),)
                ],
              ),
              Spacer(),
              Icon(Icons.bookmark_outline)
            ],
          ),
          ksizedBoxHeight,
          Row(
            children: [
              Icon(Icons.find_in_page_outlined,size: 20,color: Colors.green,),
              widthInRow,
              Text("Actively Recruting",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              ),)
            ],
          ),
          kheightinRec,
          
          Row(
            children: [
              Icon(Icons.business_center,size: 20,color: ktextColor,),
              widthInRow,
              Text("12 Open Psition",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kshowAllColor,
              ),)
            ],
          ),
          kheightinRec,
          Row(
            children: [
              Icon(Icons.access_time_filled,size: 20,color: ktextColor,),
              widthInRow,
              Text("Full time - Internship",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              ),)
            ],
          ),
          kheightinRec,
          kheightinRec,
         TextButtonWidget(text: "Show All",)
          
        ],
      ),
    );
  }
}