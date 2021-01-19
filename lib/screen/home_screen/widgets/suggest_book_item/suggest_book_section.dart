import 'package:flutter/material.dart';
import 'suggest_book_item.dart';

class SuggestBookSection extends StatefulWidget {
  SuggestBookSection();
  @override
  State<StatefulWidget> createState() => SuggestBookSectionState();
}

class SuggestBookSectionState extends State<SuggestBookSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20, left: 30, bottom: 20),
        child: Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 6),
                            child: Text(
                              'Suggest for you',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          Text(
                            'Discover your mind !',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 12,
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "See All",
                          style: TextStyle(fontSize: 16, color: Colors.black45),
                        ),
                      ),
                    )
                  ],
                )),
            Container(
                alignment: Alignment.topLeft,
                height: 230,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    SuggestBookItem(),
                    SuggestBookItem(),
                    SuggestBookItem(),
                    SuggestBookItem(),
                  ],
                )),
          ],
        ));
  }
}
