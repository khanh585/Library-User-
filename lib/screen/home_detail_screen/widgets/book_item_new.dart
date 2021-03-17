import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/book_detail_screen_2/book_detail_screen.dart';

class BookItemNew extends StatefulWidget {
  final Book book;

  const BookItemNew({Key key, this.book}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BookItemNewState();
}

class BookItemNewState extends State<BookItemNew> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BookDetailScreen(book: this.widget.book)),
          );
        },
        child: Container(
      margin: EdgeInsets.only(bottom: 19),
      height: 81,
      width: MediaQuery.of(context).size.width - 50,
      color: kBackgroundColor,
      child: Row(
        children: [
          Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(this.widget.book.image[0]),
                  fit: BoxFit.fill
                ),
                //color: Color(0xff9966).withOpacity(0.5)
                ),
          ),
          SizedBox(
            width: 21,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.widget.book.name,
                style: GoogleFonts.openSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                this.widget.book.author,
                style: GoogleFonts.openSans(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: kGreyColor),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '\$' + this.widget.book.fee.toString(),
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor),
              )
            ],
          )
        ],
      ),
    ));
  }
}
