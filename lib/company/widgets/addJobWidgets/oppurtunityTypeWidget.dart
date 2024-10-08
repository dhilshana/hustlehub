import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class OppurtunityTypeWidget extends StatefulWidget {
  const OppurtunityTypeWidget({super.key});

  @override
  State<OppurtunityTypeWidget> createState() => _OppurtunityTypeWidgetState();
}

class _OppurtunityTypeWidgetState extends State<OppurtunityTypeWidget> {

    var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Opportunity Type',style: TextStyle(
          color: kfontColor,
          fontSize: 13,
          fontWeight: FontWeight.w600
        ),),
              kheightinRec,
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0),
                ),
                child: Row(
                  children: [
                    // Internship Radio Button
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: kfontColor,
                            value: 'internship',
                            groupValue: _selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),

                          const Text('Internship'),
                        ],
                      ),
                    ),
                    // Job Radio Button
                    Expanded(
                      child: Row(
                        children: [
                          Radio<String>(
                            activeColor: kfontColor,
                            value: 'job',
                            groupValue: _selectedValue,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedValue = value;
                              });
                            },
                          ),
                         const Text('Job'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}