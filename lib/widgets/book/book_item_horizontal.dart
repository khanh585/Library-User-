import 'package:flutter/material.dart';

class BookItemHorizontal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(),
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 120,
              child: Image.asset(
                'images/book.jpg',
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100,
              padding: EdgeInsets.only(left: 10),
              height: 120,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 2, bottom: 3),
                      child: Text(
                        'Author',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black45),
                      )),
                  Container(
                      height: 49,
                      child: Text(
                        "asasasdasjkdhasldkjashdlashdlkajsdhajlskdhaskldjhaslkdjahsdlkjashdlkajshdalksjdhalskdjhaskldjahsldkjashdlkasjdhlaksjdhlasdasdadasdasdasdasddasd",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                      )),
                  Row(
                    children: [
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '5',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        child: Row(
                          children: [
                            Icon(
                              Icons.chrome_reader_mode,
                              color: Colors.grey[400],
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '200',
                              style: TextStyle(
                                  color: Colors.grey[400],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
