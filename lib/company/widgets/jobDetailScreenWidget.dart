import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hastlehub/utils/constants.dart';

class JobDetailScreenWidget extends StatelessWidget {
  String title;
  dynamic value;
  JobDetailScreenWidget({super.key,required this.value,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Container(
                  width: 150.w,
                  child: Text(title,style: TextStyle(
                              color: kfontColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600
                            ),),
                ),
          widthInRow,
          Container(
            width: 10.w,
            child: Text(':',style: TextStyle(
              color: kfontColor,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),),
          ),
          widthInRow,
                Text(value is String ? value.toUpperCase():value is List? value.join('\n'):value,style: TextStyle(
            color: kfontColor,
            fontSize: 15,
            fontWeight: FontWeight.w500
          ),)
              ],
            );
  }
}