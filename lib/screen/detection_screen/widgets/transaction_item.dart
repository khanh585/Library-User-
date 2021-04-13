import 'package:flutter/material.dart';
import 'package:user_library/models/detection.dart';
import 'package:user_library/screen/drawer_detection_screen/drawer_detection_screen.dart';

class TransactionItem extends StatelessWidget {
  final Detection item;
  TransactionItem({
    @required this.size,
    this.item,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DrawerDetectionScreen(
                      detectionId: item.id,
                      pilot: item.staffName,
                      bookshelf: item.bookShelfName,
                      avatar: item.avatar,
                    )));
      },
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.8),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  width: (size.width) - 30,
                  child: Container(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.library_books,
                          color: Colors.orange[900],
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                      ),
                      Container(
                        width: size.width / 2,
                        child: Text(
                          this.item.bookShelfName,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black87,
                              fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: size.width / 12,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.black54,
                          size: 24.0,
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
          )
        ],
      ),
    );
  }
}
