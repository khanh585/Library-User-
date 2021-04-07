import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_library/constants.dart';
import 'package:user_library/models/book.dart';
import 'package:user_library/screen/book_detail_screen/book_detail_librarian_screen.dart';
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
            MaterialPageRoute(
                builder: (context) =>
                    BookDetailLibrarianScreen(book: this.widget.book)),
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      this.widget.book.image[0],
                      fit: BoxFit.fill,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: Image.asset(
                            "images/loading1.gif",
                            height: 550.0,
                            width: 750.0,
                          ),
                        );
                      },
                    ),
                  )),
              SizedBox(
                width: 21,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: Text(
                      this.widget.book.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.openSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kBlackColor),
                    ),
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
