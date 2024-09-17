import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class CustomProgressIndicator extends StatelessWidget {
  double progress;
CustomProgressIndicator({super.key,required this.progress});

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: 10,
          decoration: BoxDecoration(
            color: kcontainerColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * progress,
                decoration: BoxDecoration(
                  color: kfontColor, // Progress color
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        );
  }
}