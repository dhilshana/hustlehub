import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/checkBoxListWidget.dart';
import 'package:hastlehub/widgets/filterTextFieldWidget.dart';
import 'package:hastlehub/widgets/textButtonWidget.dart';

class FilterModalSheetWidget extends StatefulWidget {
  const FilterModalSheetWidget({super.key});

  @override
  State<FilterModalSheetWidget> createState() => _FilterModalSheetWidgetState();
}

class _FilterModalSheetWidgetState extends State<FilterModalSheetWidget> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      shrinkWrap: true,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.close),
            Text(
              "Filter",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Close",
                  style: TextStyle(color: kshowAllColor, fontSize: 15),
                ))
          ],
        ),
        ksizedBoxHeight,
        Text(
          "Location",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        kheightinRec,
        kheightinRec,
        FilterTextFieldWidget(
          hintText: "Location",
          preicon: Icon(Icons.location_on),
          suficon: Icon(Icons.keyboard_arrow_down_outlined),
        ),
        kheightinRec,
        kheightinRec,
        Text(
          "Company",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        kheightinRec,
        kheightinRec,
        FilterTextFieldWidget(
          hintText: "Search Company",
          preicon: Icon(Icons.search),
          suficon: Icon(Icons.cancel_outlined),
        ),
        kheightinRec,
        kheightinRec,
        Text(
          "Job Type",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        CheckBoxListWidget(title: "Internship",count: "20",),
        CheckBoxListWidget(title: "Full-time",count: "30",),
        CheckBoxListWidget(title: "Part-time",count: "40",),
        kheightinRec,
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ktextColor
              )
            )
          ),
        ),
        kheightinRec,
        Text(
          "On-Site/Remote",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        CheckBoxListWidget(title: "On-site",count: "20",),
        CheckBoxListWidget(title: "Hybrid",count: "30",),
        CheckBoxListWidget(title: "Remote",count: "40",),
        kheightinRec,
        TextButtonWidget(text: "See 44 results"),
        kheightinRec
      ],
    );
  }
}