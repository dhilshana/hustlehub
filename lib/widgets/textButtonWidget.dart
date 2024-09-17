import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  String text;
  
  TextButtonWidget({super.key, required this.text});

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Set border radius
              ),
            ),
          ),
          child: Text(
            widget.text,
            style: TextStyle(color: Colors.white),
          )),
    );
  }
}
