// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:user_library/models/book.dart';
// import 'package:user_library/models/popularbook_model.dart';
// import 'package:user_library/screen/book_detail_screen_2/widgets/custom_tab_indicator.dart';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:user_library/database/database.dart';
// import 'package:user_library/models/book.dart';
// import 'package:user_library/models/wishlist.dart';
// import 'package:user_library/widgets/animation/fade_side_up.dart';

// import 'package:user_library/widgets/app_bar_custom.dart';
// import 'package:user_library/widgets/description_handel.dart';
// import 'package:user_library/screen/book_detail_screen/widgets/list_categories.dart';

// import '../../constants.dart';


// class BookDetailScreen extends StatefulWidget {
//   final Book book;
//   BookDetailScreen({this.book});

//   @override
//   _BookDetailState createState() => _BookDetailState();
// }

// class _BookDetailState extends State<BookDetailScreen> {
//   bool _inWishList = false;
//   @override
//   void initState() {
//     _checkInWishList();
//     super.initState();
//   }

//   Future<void> _checkInWishList() async {
//     final database =
//         await $FloorAppDatabase.databaseBuilder('app_database.db').build();
//     final wishListDAO = database.wishListDao;
//     wishListDAO
//         .findWishListById(this.widget.book.id)
//         .then((value) => setState(() {
//               _inWishList = value != null;
//             }));
//   }

//   Future<void> _addToWishList() async {
//     final database =
//         await $FloorAppDatabase.databaseBuilder('app_database.db').build();
//     final wishListDAO = database.wishListDao;
//     final id = this.widget.book.id;
//     final name = this.widget.book.name;
//     final author = this.widget.book.author;
//     final thumnail =
//         this.widget.book.image.length != 0 ? this.widget.book.image[0] : '';

//     final wish = WishList(id, name, author, thumnail, true);
//     wishListDAO.insertWishList(wish);
//     setState(() {
//       _inWishList = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: Container(
//         margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
//         height: 49,
//         color: Colors.transparent,
//         child: FlatButton(
//           color: kMainColor,
//           onPressed: () {},
//           child: Text(
//             'Add to wishlist',
//             style: GoogleFonts.openSans(
//                 fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
//           ),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//       body: SafeArea(
//         child: Container(
//           child: CustomScrollView(
//             slivers: <Widget>[
//               SliverAppBar(
//                 backgroundColor: kMainColor,
//                 expandedHeight: MediaQuery.of(context).size.height * 0.5,
//                 flexibleSpace: Container(
//                   color: Color(this.widget.book.color),
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   child: Stack(
//                     children: <Widget>[
//                       // Positioned(
//                       //   left: 25,
//                       //   top: 35,
//                       //   child: GestureDetector(
//                       //     onTap: () {
//                       //       Navigator.pushReplacementNamed(
//                       //           context, "/HomeDetailScreen");
//                       //     },
//                       //     child: Container(
//                       //       width: 32,
//                       //       height: 32,
//                       //       decoration: BoxDecoration(
//                       //           borderRadius: BorderRadius.circular(5),
//                       //           color: kWhiteColor),
//                       //       child: SvgPicture.asset(
//                       //           'icons/icon_back_arrow.svg'),
//                       //     ),
//                       //   ),
//                       // ),
//                       Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Container(
//                           margin: EdgeInsets.only(bottom: 62),
//                           width: 172,
//                           height: 225,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             image: DecorationImage(
//                               image: AssetImage(this.widget.book.image),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               SliverList(
//                   delegate: SliverChildListDelegate([
//                 Padding(
//                   padding: EdgeInsets.only(top: 24, left: 25),
//                   child: Text(
//                     this.widget.book.name,
//                     style: GoogleFonts.openSans(
//                         fontSize: 27,
//                         color: kBlackColor,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 7, left: 25),
//                   child: Text(
//                     this.widget.book.author,
//                     style: GoogleFonts.openSans(
//                         fontSize: 14,
//                         color: kGreyColor,
//                         fontWeight: FontWeight.w400),
//                   ),
//                 ),
//                 Padding(
//                     padding: EdgeInsets.only(top: 7, left: 25),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           '\$',
//                           style: GoogleFonts.openSans(
//                               fontSize: 14,
//                               color: kMainColor,
//                               fontWeight: FontWeight.w600),
//                         ),
//                         Text(
//                           this.widget.book.price,
//                           style: GoogleFonts.openSans(
//                               fontSize: 32,
//                               color: kMainColor,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ],
//                     )),
//                 Container(
//                   height: 28,
//                   margin: EdgeInsets.only(top: 23, bottom: 36),
//                   padding: EdgeInsets.only(left: 25),
//                   child: DefaultTabController(
//                     length: 3,
//                     child: TabBar(
//                         labelPadding: EdgeInsets.all(0),
//                         indicatorPadding: EdgeInsets.all(0),
//                         isScrollable: true,
//                         labelColor: kBlackColor,
//                         unselectedLabelColor: kGreyColor,
//                         labelStyle: GoogleFonts.openSans(
//                             fontSize: 14, fontWeight: FontWeight.w700),
//                         unselectedLabelStyle: GoogleFonts.openSans(
//                             fontSize: 14, fontWeight: FontWeight.w600),
//                         indicator: RoundedRectangleTabIndicator(
//                             weight: 2, width: 30, color: kBlackColor),
//                         tabs: [
//                           Tab(
//                             child: Container(
//                               margin: EdgeInsets.only(right: 39),
//                               child: Text('Description'),
//                             ),
//                           ),
//                           Tab(
//                             child: Container(
//                               margin: EdgeInsets.only(right: 39),
//                               child: Text('Reviews'),
//                             ),
//                           ),
//                           Tab(
//                             child: Container(
//                               margin: EdgeInsets.only(right: 39),
//                               child: Text('Similar'),
//                             ),
//                           )
//                         ]),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
//                   child: Text(
//                     this.widget.book.description,
//                     style: GoogleFonts.openSans(
//                       fontSize: 12,
//                       fontWeight: FontWeight.w400,
//                       color: kGreyColor,
//                       letterSpacing: 1.5,
//                       height: 2,
//                     ),
//                   ),
//                 )
//               ]))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// // class BookDetailScreen extends StatelessWidget {
// //   final PopularBookModel popularBookModel;

// //   BookDetailScreen({Key key, @required this.popularBookModel})
// //       : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
    
// //   }
// // }