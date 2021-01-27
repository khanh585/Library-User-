import 'package:flutter/material.dart';

class ItemBookBottom extends StatelessWidget {
  const ItemBookBottom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => ()),
        // );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          children: [
            Container(
              width: 120,
              child: Image.asset(
                'images/notebook.png',
                fit: BoxFit.fill,
                alignment: Alignment.topLeft,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 15 * 2 - 120 - 50,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Author',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
            Container(
              width: 50,
              alignment: Alignment.topCenter,
              child: IconButton(
                onPressed: () {
                  print('book mark');
                },
                icon: Icon(Icons.bookmark_outline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
