import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddReview extends StatefulWidget {
  final void Function() refresh;
  const AddReview({
    Key key,
    this.refresh,
  }) : super(key: key);
  @override
  _AddReviewState createState() => _AddReviewState();
}

class _AddReviewState extends State<AddReview> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            'images/bama.jpg',
            fit: BoxFit.contain,
            width: 160,
            height: 170,
          ),
          Container(
            margin: const EdgeInsets.only(top: 15.0),
          ),
          Text(
            'The Tiny Dragon',
            style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.w400,
                fontFamily: 'RobotoMono'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12.0),
          ),
          Text(
            'Contract Service Senior Manager',
            style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w300,
                fontFamily: 'RobotoMono'),
          ),
          Divider(
            color: Colors.black,
            height: 50,
            indent: 20,
            endIndent: 20,
          ),
          Text(
            'Rate overall cooperation'.toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontFamily: 'RobotoMono'),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12.0),
          ),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Divider(
            color: Colors.black,
            height: 50,
            indent: 20,
            endIndent: 20,
          ),
          TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                hintText: "Enter your feedback",
                filled: true,
                fillColor: Colors.grey[200]),
          ),
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {},
            child: const Text('Add your review', style: TextStyle(fontSize: 20)),
          ),
          
        ],
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
