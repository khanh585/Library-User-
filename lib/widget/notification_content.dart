import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class NotifiContent extends StatefulWidget {
  const NotifiContent({
    Key key,
    this.status,
    this.content,
    this.title,
    this.time,
  }) : super(key: key);
  final status;
  final content;
  final title;
  final time;

  @override
  _NotifiContentState createState() => _NotifiContentState();
}

class _NotifiContentState extends State<NotifiContent> {
  List<Color> colors = [Colors.red, Colors.green, Colors.amber];
  int pickColor = 0;
  setColor() {
    if (this.widget.status == 'success') {
      pickColor = 1;
    } else if (this.widget.status == 'warning') {
      pickColor = 0;
    } else if (this.widget.status == 'processing') {
      pickColor = 2;
    }
    setState(() {
      pickColor = pickColor;
    });
  }

  @override
  void initState() {
    super.initState();
    setColor();
  }

  bool isDetail = false;
  void onDetail() {
    isDetail = !isDetail;
    setState(() {
      isDetail = isDetail;
    });
  }

  @override
  Widget build(BuildContext context) {
    final wi = MediaQuery.of(context).size.width - 20 * 2;
    // final double he = 80;
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 15),
      width: wi,
      // height: he + 2,
      decoration: BoxDecoration(
        color: this.colors[this.pickColor],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 1, bottom: 1, right: 1, left: 5),

        // height: he,
        width: wi - 5,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Container(
          margin: EdgeInsets.only(left: 10, top: 2),
          padding: EdgeInsets.only(bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    this.widget.title,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    this.widget.time,
                    style: TextStyle(color: Colors.black45, fontSize: 14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Total: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Flexible(
                    child: Text(
                      '5',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'List: ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  Flexible(
                    child: ReadMoreText(
                      this.widget.content,
                      trimLines: 1,
                      trimLength: 1,
                      delimiter: '  \n',
                      colorClickableText: this.colors[this.pickColor],
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: this.colors[this.pickColor]),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
