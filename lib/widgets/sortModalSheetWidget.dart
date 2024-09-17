import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/textButtonWidget.dart';

class SortModalSheetWidget extends StatefulWidget {
  const SortModalSheetWidget({super.key});

  @override
  State<SortModalSheetWidget> createState() => _SortModalSheetWidgetState();
}

class _SortModalSheetWidgetState extends State<SortModalSheetWidget> {
   var _selectedValue;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
            shrinkWrap: true,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(
                    color: kfontColor,
                    width: 1
                  ))
                ),
                child: Row(
                  children: [
                    Text("Sort by",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),),
                    Spacer(),
                    TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      child: Text("Close",style: TextStyle(
                        color: kshowAllColor,
                        fontSize: 15
                      ),),
                    )
                  ],
                ),
              ),
              RadioListTile<String>(
                title: const Text('Relevency'),
                value: 'Relevency',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing, // Set the radio icon to the right
                activeColor: kshowAllColor,
              ),
              RadioListTile<String>(
                title: const Text('Newest'),
                value:'Newest',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing, // Set the radio icon to the right
                activeColor: kshowAllColor,
              ),
              RadioListTile<String>(
                title: const Text('Popular'),
                value: 'Popular',
                groupValue: _selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                controlAffinity: ListTileControlAffinity.trailing, // Set the radio icon to the right
                activeColor: kshowAllColor,
              ),
              TextButtonWidget(text: "Show All")
            ]
    );
  }
}