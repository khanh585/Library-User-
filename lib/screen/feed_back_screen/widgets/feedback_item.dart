// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:user_library/models/feedback.dart';

// class FeedbackItem extends StatelessWidget {
//   final Feedback feedback;
//   const FeedbackItem({
//     this.feedback,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.only(left: 10, right: 10),
//       margin: EdgeInsets.only(bottom: 5, top: 5),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                       margin: EdgeInsets.only(right: 10),
//                       child: CircleAvatar(
//                         radius: 20.0,
//                         backgroundImage: AssetImage('images/book.jpg'),
//                         backgroundColor: Colors.transparent,
//                       )),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Kita Chihoko',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 14,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'RobotoMono'),
//                       ),
//                       Text(
//                         'October 14, 2018',
//                         style: TextStyle(
//                             color: Colors.grey,
//                             fontSize: 13,
//                             fontWeight: FontWeight.w400,
//                             fontFamily: 'RobotoMono'),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 3),
//                 child: RatingBar.builder(
//                   ignoreGestures: true,
//                   initialRating: this.feedback.rating.toDouble(),
//                   minRating: 1,
//                   direction: Axis.horizontal,
//                   allowHalfRating: true,
//                   itemCount: 5,
//                   itemSize: 20,
//                   itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                   itemBuilder: (context, _) => Icon(
//                     Icons.star,
//                     color: Colors.amber,
//                   ),
//                   onRatingUpdate: (rating) {
//                     print(rating);
//                   },
//                 ),
//               )
//             ],
//           ),
//           Container(
//             width: MediaQuery.of(context).size.width,
//             margin: EdgeInsets.only(left: 50, bottom: 15),
//             child: Text(
//               this.feedback.content,
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                   fontFamily: 'RobotoMono'),
//             ),
//           ),
//           Divider(
//             color: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
// }
