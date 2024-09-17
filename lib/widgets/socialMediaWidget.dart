import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';

class SocialMediaWidget extends StatelessWidget {
  Image image;
  SocialMediaWidget({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: kcontainerColor,
      child: image,
    );
  }
}