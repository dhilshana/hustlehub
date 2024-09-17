import 'package:flutter/material.dart';
import 'package:hastlehub/utils/constants.dart';
import 'package:hastlehub/widgets/customBotNavWidget.dart';
import 'package:hastlehub/widgets/filterModalSheetWidget.dart';
import 'package:hastlehub/widgets/recommendationWidget.dart';
import 'package:hastlehub/widgets/searchWidget.dart';
import 'package:hastlehub/widgets/sortOptionWidgets.dart';
import 'package:hastlehub/widgets/topCompaniesWidget.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  bool isSearching = false;

  // Method to update the search state
  void _onSearchChanged(String query) {
    setState(() {
      isSearching =
          query.isNotEmpty; // Set true if there's input, false otherwise
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true, // Allows layout to adjust when keyboard is visible
       
        backgroundColor: kBgColor,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SearchWidget(
                      onSearchChanged: _onSearchChanged,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true, // Allows more control over the modal height
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            builder: (BuildContext context) {
                              return Container(
                                height: MediaQuery.of(context).size.height *
                                    (2.5 / 3), // 2/3 of the screen height
                                child: FilterModalSheetWidget(),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 25, // Adjust the size accordingly
                          backgroundColor: Colors.white,
                          child: Icon(Icons.tune),
                        ),
                      ),
                      Positioned(
                        left: 35,
                        bottom: 30,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 10,
                          child: Text(
                            "4",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ksizedBoxHeight,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!isSearching) ...[
                        const Row(
                          children: [
                            Text(
                              "Top Companies",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "Show All",
                              style: TextStyle(color: kshowAllColor),
                            ),
                          ],
                        ),
                        ksizedBoxHeight,
                        SizedBox(
                          height: 250, // Set a fixed height for the horizontal list
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return TopCompaniesWidget();
                            },
                          ),
                        ),
                        kheightinRec,
                        kheightinRec,
                        const Row(
                          children: [
                            Text(
                              "Recommendations",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Spacer(),
                            Text(
                              "Show All",
                              style: TextStyle(color: kshowAllColor),
                            ),
                          ],
                        ),
                      ] else ...[
                        SortOptionWidget(),
                      ],
                      ksizedBoxHeight,
                      ListView.builder(
                        shrinkWrap: true, // Makes the ListView take only as much height as needed
                        physics: NeverScrollableScrollPhysics(), // Prevents inner scrolling
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return RecommendationWidget();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
