import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class JobDetailsWidget extends StatefulWidget {
  const JobDetailsWidget({super.key});

  @override
  State<JobDetailsWidget> createState() => _JobDetailsWidgetState();
}

class _JobDetailsWidgetState extends State<JobDetailsWidget> {
  int _selectedYear = 0;

  TextEditingController jobTitleController = TextEditingController();
  TextEditingController yearsController = TextEditingController();
  TextEditingController skillController = TextEditingController();
  TextEditingController openingsCountController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController preferenceController = TextEditingController();
  var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Job details',
          style: TextStyle(
              color: kfontColor, fontSize: 13, fontWeight: FontWeight.w600),
        ),
        kheightinRec,
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(width: 0)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Job title',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                controller: jobTitleController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    hintText: 'eg.Software Engineer Trainee',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ktextColor
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
              ksizedBoxHeight,
              Text(
                'Required years of experience',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                controller: yearsController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    suffixIcon: PopupMenuButton(
                      icon: Icon(Icons.arrow_drop_down),
                      itemBuilder: (context) => List.generate(10, (index) {
                        return PopupMenuItem(
                          value: index + 1,
                          child: Text('${index + 1}'),
                        );
                      }),
                      onSelected: (value) {
                        setState(() {
                          _selectedYear = value;
                          yearsController.text = _selectedYear.toString();
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
              ksizedBoxHeight,
              Text(
                'Skills Required',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                controller: skillController,
                decoration: InputDecoration(
                    hintText: 'e.g. Java',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ktextColor
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
              ksizedBoxHeight,
              Text(
                'Job type',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<String>(
                  
                    activeColor: kfontColor,
                    value: 'inoffice',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),

                  const Text('In Office'),
                  // Job Radio Button
                  Radio<String>(
                    activeColor: kfontColor,
                    value: 'hybrid',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  const Text('Hybrid'),
                  Radio<String>(
                    activeColor: kfontColor,
                    value: 'remote',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  const Text('Remote'),
                ],
              ),
              kheightinRec,
              Text(
                'Part-time/Full-time',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Radio<String>(
                  
                    activeColor: kfontColor,
                    value: 'parttime',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),

                  const Text('Part-Time'),
                  // Job Radio Button
                  Radio<String>(
                    activeColor: kfontColor,
                    value: 'fulltime',
                    groupValue: _selectedValue,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedValue = value;
                      });
                    },
                  ),
                  const Text('Full-Time'),
                ]
              ),
              Text(
                'Number of openings',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                controller: openingsCountController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    hintText: 'eg.4',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ktextColor
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
              ksizedBoxHeight,
              Text(
                'Job description',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                controller: descController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    hintText: 'Key Responsibilities\n1.\n2.\n3.',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ktextColor
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
              ksizedBoxHeight,
              Text(
                'Additional candidate preference',
                style: TextStyle(
                  color: kfontColor,
                  fontSize: 13,
                ),
              ),
              kheightinRec,
              TextField(
                keyboardType: TextInputType.multiline,
                minLines: 3,
                maxLines: 5,
                controller: preferenceController,
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    hintText: '1.eg.Computer Science Graduate preferred\n2.\n3.',
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: ktextColor
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: kfontColor,
                    )),
                    border: OutlineInputBorder()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
