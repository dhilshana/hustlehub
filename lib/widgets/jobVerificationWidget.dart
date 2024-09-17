import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class JobVerificationWidget extends StatefulWidget {
  String title;
  Icon icon;
  JobVerificationWidget({super.key,required this.title,required this.icon});

  @override
  State<JobVerificationWidget> createState() => _JobVerificationWidgetState();
}

class _JobVerificationWidgetState extends State<JobVerificationWidget> {
  bool _value=false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[ Container(
     width: MediaQuery.of(context).size.width/2,
        decoration: BoxDecoration(
          color: kcontainerColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: ktextColor.withOpacity(0.8),
              offset: Offset(-5, 5),
              blurRadius: 10,
              spreadRadius: 1,
              blurStyle: BlurStyle.normal
            )
          ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.icon,
            Text(widget.title,style: TextStyle(
              color: kfontColor,
              fontSize: 18
            ),),
            
          ],
        ),
      ),
      Positioned(
            top: 10,
            right: 10,
            child:  Checkbox(
                        value: _value,
                        checkColor: Colors.white,
                        activeColor: Colors.orange,
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Removes extra margin around the checkbox
                        onChanged: (bool? value) {
                          setState(() {
                            _value = value!;
                          });
                        },
                      ),
          )
      ]
    );
  }
}