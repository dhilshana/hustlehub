import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/users/widgets/jobdetailsWidget.dart';

class RecommendationWidget extends StatefulWidget {
  Map<String, dynamic> jobDetails;
  RecommendationWidget({super.key, required this.jobDetails});

  @override
  State<RecommendationWidget> createState() => _RecommendationWidgetState();
}

class _RecommendationWidgetState extends State<RecommendationWidget> {

   String calculateTimeAgo(String? jobDate) {
    if (jobDate == null) return "Date not available - ";

    DateTime postedDate = DateTime.parse(jobDate); // Parse the job date
    final now = DateTime.now();
    final difference = now.difference(postedDate);

    if (difference.inDays > 1) {
      return '${difference.inDays} days ago - ';
    } else if (difference.inDays == 1) {
      return '1 day ago - ';
    } else if (difference.inHours >= 1) {
      return '${difference.inHours} hours ago - ';
    } else if (difference.inMinutes >= 1) {
      return '${difference.inMinutes} minutes ago - ';
    } else {
      return 'Just now - ';
    }
  }


  @override
  Widget build(BuildContext context) {
    print(widget.jobDetails);
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 15.0),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
            color: kcontainerColor,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.radio_button_checked),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.jobDetails['jobTitle'],
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: kfontColor),
                  ),
                  Text(
                    widget.jobDetails['companyName'],
                  )
                ],
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.bookmark_outline))
            ],
          ),
          kheightinRec,
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
              ),
              widthInRow,
              Text(
                widget.jobDetails['jobDetails']['jobLocation'],
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kfontColor),
              )
            ],
          ),
          kheightinRec,
          Row(
            children: [
              Icon(
                Icons.paid,
                size: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "${widget.jobDetails['jobDetails']['initialSalary']}${widget.jobDetails['jobDetails']['currency']} - ${widget.jobDetails['jobDetails']['finalSalary']}${widget.jobDetails['jobDetails']['currency']} ",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: kfontColor),
              )
            ],
          ),
          kheightinRec,
          kheightinRec,
          Row(
            children: [
              JobScreenWidget(
                icon: const Icon(
                  Icons.video_camera_front,
                  size: 18,
                ),
                text: widget.jobDetails['jobDetails']['jobType'],
              ),
              JobScreenWidget(
                icon: const Icon(
                  Icons.access_time_filled,
                  size: 18,
                ),
                text: widget.jobDetails['jobDetails']['oppurtunityType'],
              ),
              JobScreenWidget(
                icon: const Icon(
                  Icons.business_center,
                  size: 18,
                ),
                text: "${widget.jobDetails['jobDetails']['experience']} Year of Exp",
              ),
            ],
          ),
          kheightinRec,
          kheightinRec,
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: ktextColor, width: 0.5)),
          ),
          kheightinRec,
          Row(
            children: [
              Icon(
                Icons.history,
                size: 18,
                color: ktextColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                calculateTimeAgo(widget.jobDetails['jobDetails']['date']),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    color: ktextColor),
              ),
              Text(
                '${widget.jobDetails['jobDetails']['applicationCount']??'0'} Applications',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: kshowAllColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
