import 'package:flutter/material.dart';
import 'package:user_library/widgets/book/book_item_suggestion.dart';

class SuggestBookSection extends StatefulWidget {
  SuggestBookSection();
  @override
  State<StatefulWidget> createState() => SuggestBookSectionState();
}

class SuggestBookSectionState extends State<SuggestBookSection> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: 25, right: 0),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(bottom: 20, top: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            'Suggest for you',
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "See All",
                        style: TextStyle(fontSize: 13, color: Colors.black45),
                      ),
                    ),
                  )
                ],
              )),
          Container(
              height: 240,
              alignment: Alignment.center,
              child: ListView(
                padding: EdgeInsets.only(left: 25, right: 25),
                scrollDirection: Axis.horizontal,
                children: [
                  BookItemSuggestion(),
                  BookItemSuggestion(),
                  BookItemSuggestion(),
                  BookItemSuggestion(),
                ],
              )),
        ],
      ),
    );
  }
}
