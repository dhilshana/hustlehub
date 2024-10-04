import 'package:flutter/material.dart';
import 'package:hastlehub/company/widgets/postedJobWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Company Home"),
    );
  }
}