import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class JobScreenWidget extends StatelessWidget {
  Icon icon ;
  String text;
  JobScreenWidget({super.key,required this.icon,required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.only(left: 8,right: 8),
      decoration: BoxDecoration(
        color: kcontainerColor,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        children: [
          icon,
          SizedBox(width: 5,),
          Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12
          ),)
        ],
      ),
    );
  }
}