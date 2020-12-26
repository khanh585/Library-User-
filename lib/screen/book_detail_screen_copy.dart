import 'package:flutter/material.dart';
import 'package:user_library/widget/list_category_button.dart';

class BookDetail_Screen extends StatefulWidget {
  const BookDetail_Screen({Key key}) : super(key: key);

  @override
  _BookDetail_ScreenState createState() => _BookDetail_ScreenState();
}

class _BookDetail_ScreenState extends State<BookDetail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(250, 252, 251, 1),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.close_rounded,
              color: Color(0xFF545D68),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        backgroundColor: Color.fromRGBO(250, 252, 251, 1),
        body: Stack(children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 70, left: 4, right: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(147, 149, 148, .7),
                    blurRadius: 20,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                margin: EdgeInsets.only(top: 85, left: 3, right: 3),
                child: Column(
                  children: [
                    // Category, Author, Bookname
                    Container(
                      child: Column(
                        children: [
                          // ListCategoryButton(),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Author',
                            style: TextStyle(
                                color: Color.fromRGBO(100, 100, 100, 1),
                                fontSize: 15),
                          ),
                          Text(
                            'Book name',
                            style: TextStyle(
                                color: Colors.black87,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // Divider
                    Padding(
                      padding: EdgeInsets.only(top: 1, right: 20, left: 20),
                      child: Divider(
                        color: Colors.black26,
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 2 - 40,
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          TabBarButton(),
                          //Condition, Page, Cover, Languge
                          BookInfoBar(),
                          //Description
                          DescriptionCard(),
                          Container(
                            height: 80,
                            margin:
                                EdgeInsets.only(top: 12, left: 20, right: 20),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: Colors.black54,
                                  width: 3.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Book image
          Container(
            alignment: Alignment.topCenter,
            child: Image.asset(
              'images/notebook.png',
              fit: BoxFit.contain,
              height: 120,
              alignment: Alignment.topCenter,
            ),
          ),
          AddToCartButton(),
        ]));
  }
}

class BookInfoBar extends StatelessWidget {
  const BookInfoBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 241, 240, .7),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
            ),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BookInfoCell('Condition', '4.0'),
                BookInfoCell('Pages', '210'),
                BookInfoCell('Cover', 'Hard'),
                BookInfoCell('Languge', 'Vietnamese'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class DescriptionCard extends StatelessWidget {
  const DescriptionCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 12, right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Description',
              style: TextStyle(color: Colors.black54, fontSize: 16)),
          SizedBox(
            height: 5,
          ),
          Text(
            'Cái gì của mình tốt nhất nên giữ cho riêng mình thôi.Chứ để thành của nhiều người, dù vui hay buồn, nó cũng thành chuyện để cợt nhả',
            style: TextStyle(color: Colors.black87, fontSize: 18),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width - 20,
      margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height - 160, left: 12, right: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromRGBO(40, 179, 152, 1)),
      child: FlatButton(
        height: 55,
        minWidth: MediaQuery.of(context).size.width - 20,
        padding: EdgeInsets.all(1),
        onPressed: () {
          print('press');
        },
        child: Text(
          'Add book to borrow',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class TabBarButton extends StatelessWidget {
  const TabBarButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(2),
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TabButton('About book', true),
          TabButton('Feedback', false),
        ],
      ),
    );
  }
}

class BookInfoCell extends StatelessWidget {
  final String title, info;
  const BookInfoCell(this.title, this.info);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black54, fontSize: 14),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            info,
            style: TextStyle(
                color: Color.fromRGBO(100, 105, 105, 1),
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String text;
  final bool isFocus;
  const TabButton(
    this.text,
    this.isFocus,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 40,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          FlatButton(
            onPressed: null,
            child: Text(
              text,
              style: TextStyle(
                  color: isFocus ? Colors.black87 : Colors.black45,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 60,
            height: isFocus ? 6 : 0,
            color: Colors.greenAccent,
          )
        ],
      ),
    );
  }
}
