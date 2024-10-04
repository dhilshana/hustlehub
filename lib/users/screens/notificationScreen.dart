import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/users/widgets/notificationWidget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
          leading: IconButton(icon:const Icon(Icons.chevron_left),onPressed: (){
            Navigator.pop(context);
          },),
          backgroundColor: kBgColor,
        ),
        backgroundColor: kBgColor,
        body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) {
            return const NotificationWidget();
          },
        ),
      ),
    );
  }
}